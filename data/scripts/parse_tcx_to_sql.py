import xml.etree.ElementTree as ET
from datetime import datetime
from math import radians, sin, cos, sqrt, atan2
import sys
import os

def haversine(lat1, lon1, lat2, lon2):
    R = 6371000
    lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    a = sin(dlat/2)**2 + cos(lat1) * cos(lat2) * sin(dlon/2)**2
    c = 2 * atan2(sqrt(a), sqrt(1-a))
    return R * c

def parse_tcx_to_sql(tcx_file):
    output_dir = '../sql'
    os.makedirs(output_dir, exist_ok=True)
    base_name = os.path.basename(tcx_file)
    sql_file = os.path.join(output_dir, os.path.splitext(base_name)[0] + '.sql')
    tree = ET.parse(tcx_file)
    root = tree.getroot()
    ns = {
        'tcx': 'http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2',
        'tpx': 'http://www.garmin.com/xmlschemas/ActivityExtension/v2'
    }
    course_name = root.find('.//tcx:Course/tcx:Name', ns).text
    total_distance = 0.0
    total_time = 0
    points = []
    elevation_gain = 0
    max_elevation = float('-inf')
    min_elevation = float('inf')
    max_speed = float('-inf')
    min_speed = float('inf')
    
    for trackpoint in root.findall('.//tcx:Trackpoint', ns):
        time = datetime.fromisoformat(trackpoint.find('tcx:Time', ns).text)
        lat = float(trackpoint.find('tcx:Position/tcx:LatitudeDegrees', ns).text)
        lon = float(trackpoint.find('tcx:Position/tcx:LongitudeDegrees', ns).text)
        alt = float(trackpoint.find('tcx:AltitudeMeters', ns).text)
        speed_elem = trackpoint.find('.//tpx:Speed', ns)
        speed = float(speed_elem.text) if speed_elem is not None else 0.0
        points.append((lat, lon, time, alt, speed))
        max_elevation = max(max_elevation, alt)
        min_elevation = min(min_elevation, alt)
        if speed > 0:
            max_speed = max(max_speed, speed)
            min_speed = min(min_speed, speed) if min_speed > 0 else speed
        if len(points) > 1:
            prev_lat, prev_lon, prev_time, prev_alt, _ = points[-2]
            distance = haversine(prev_lat, prev_lon, lat, lon)
            total_distance += distance
            time_diff = (time - prev_time).total_seconds()
            total_time += time_diff
            if alt > prev_alt:
                elevation_gain += alt - prev_alt
    
    avg_speed = total_distance / total_time if total_time > 0 else 0
    start_point = points[0]
    end_point = points[-1]
    
    with open(sql_file, 'w') as f:
        f.write("BEGIN;\n")
        url = course_name.lower().replace(' ', '-')
        current_time = int(datetime.now().timestamp())
        f.write(
            f"""INSERT INTO routes (
                name, url, length, duration, 
                category, created_at
            ) VALUES (
                '{course_name}', '{url}', {int(total_distance)}, {int(total_time)},
                'walking', {current_time}
            );\n"""
        )
        
        for point in points:
            lat, lon, time, alt, speed = point
            time_timestamp = int(time.timestamp())
            f.write(
                f"""INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint({lon}, {lat}), 4326), 
                    {time_timestamp}, {int(alt)}, {speed}
                );\n"""
            )
        f.write("COMMIT;\n")
    print(f"SQL file generated: {sql_file}")

def process_tcx_directory(directory_path):
    output_dir = '../sql'
    os.makedirs(output_dir, exist_ok=True)
    existing_sql_files = {os.path.splitext(f)[0] for f in os.listdir(output_dir) if f.endswith('.sql')}
    processed = 0
    skipped = 0
    
    for filename in os.listdir(directory_path):
        if filename.endswith('.tcx'):
            base_name = os.path.splitext(filename)[0]
            if base_name in existing_sql_files:
                print(f"Пропуск {filename} (SQL файл уже существует)")
                skipped += 1
                continue
            tcx_path = os.path.join(directory_path, filename)
            try:
                parse_tcx_to_sql(tcx_path)
                processed += 1
            except Exception as e:
                print(f"Ошибка при обработке {filename}: {str(e)}")
    
    print(f"\nОбработка завершена:")
    print(f"Обработано файлов: {processed}")
    print(f"Пропущено файлов: {skipped}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Использование: python parse_tcx_to_sql.py <путь_к_tcx_файлу_или_папке>")
        sys.exit(1)
    
    path = sys.argv[1]
    if not os.path.exists(path):
        print(f"Ошибка: путь {path} не найден")
        sys.exit(1)
    
    if os.path.isdir(path):
        process_tcx_directory(path)
    else:
        parse_tcx_to_sql(path)