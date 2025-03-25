BEGIN;
INSERT INTO routes (
                    route_id, user_id, name, url, description,
                    length, duration, tags, 
                    category, created_at, status,
                    images
                ) VALUES (
                    8, 8, 'Лыткарино - Кот', 'lytkarino-kot', 'Описание пока не добавлено',
                    18653, 0, ARRAY['forest']::tag_type[],
                    'walking', 1741996736, 'approved', ARRAY['lytkarino-kot_1.png']
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.984636, 55.59922), 4326), 
                    1, 122, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.984186, 55.599266), 4326), 
                    1, 123, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.983122, 55.598601), 4326), 
                    1, 124, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.982086, 55.599041), 4326), 
                    1, 126, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.981786, 55.599035), 4326), 
                    1, 127, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.981238, 55.598751), 4326), 
                    1, 127, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.980643, 55.598969), 4326), 
                    1, 126, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.98031, 55.598763), 4326), 
                    1, 125, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.979747, 55.598878), 4326), 
                    1, 127, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.979409, 55.598439), 4326), 
                    1, 125, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.978336, 55.597795), 4326), 
                    1, 128, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.978762, 55.597586), 4326), 
                    1, 126, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.97866, 55.597351), 4326), 
                    1, 126, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.97876, 55.597093), 4326), 
                    1, 127, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.978505, 55.596682), 4326), 
                    1, 129, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.977666, 55.596348), 4326), 
                    1, 139, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.977045, 55.595565), 4326), 
                    1, 144, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.976581, 55.595665), 4326), 
                    1, 145, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.974461, 55.595571), 4326), 
                    1, 147, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.968738, 55.594312), 4326), 
                    1, 148, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.963956, 55.596595), 4326), 
                    1, 146, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.963783, 55.597286), 4326), 
                    1, 147, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.961968, 55.596936), 4326), 
                    1, 148, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.960756, 55.596267), 4326), 
                    1, 148, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.959142, 55.596365), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.958863, 55.596176), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.958628, 55.595416), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.958216, 55.595286), 4326), 
                    1, 147, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.956275, 55.595564), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.951896, 55.597828), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.951497, 55.59845), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.949342, 55.598965), 4326), 
                    1, 148, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.9492, 55.59894), 4326), 
                    1, 148, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.949094, 55.59855), 4326), 
                    1, 148, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.949236, 55.597822), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.949109, 55.597472), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.948373, 55.596719), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.947141, 55.596359), 4326), 
                    1, 151, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.945678, 55.596207), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.944494, 55.596389), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.943927, 55.596693), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.942396, 55.598121), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.941667, 55.59825), 4326), 
                    1, 151, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.941129, 55.598665), 4326), 
                    1, 151, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.940465, 55.598792), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.939599, 55.598383), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.938399, 55.598339), 4326), 
                    1, 157, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.937253, 55.597902), 4326), 
                    1, 159, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.935452, 55.59758), 4326), 
                    1, 154, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.935352, 55.597401), 4326), 
                    1, 154, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.93549, 55.597278), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.935374, 55.59715), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.933946, 55.596139), 4326), 
                    1, 156, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.932965, 55.596022), 4326), 
                    1, 156, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.932553, 55.595803), 4326), 
                    1, 157, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.931341, 55.596021), 4326), 
                    1, 157, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.92895, 55.595998), 4326), 
                    1, 159, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.92769, 55.595563), 4326), 
                    1, 162, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.926729, 55.595439), 4326), 
                    1, 163, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.925961, 55.594956), 4326), 
                    1, 163, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.926937, 55.594447), 4326), 
                    1, 164, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.926813, 55.594901), 4326), 
                    1, 163, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.926976, 55.594938), 4326), 
                    1, 163, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.925813, 55.594824), 4326), 
                    1, 163, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.923655, 55.594067), 4326), 
                    1, 164, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.923373, 55.593854), 4326), 
                    1, 164, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.923157, 55.593905), 4326), 
                    1, 164, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.923306, 55.593765), 4326), 
                    1, 163, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.922949, 55.593533), 4326), 
                    1, 165, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.923444, 55.593328), 4326), 
                    1, 163, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.922896, 55.593463), 4326), 
                    1, 165, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.921372, 55.592536), 4326), 
                    1, 171, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.921203, 55.592286), 4326), 
                    1, 170, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.920487, 55.591963), 4326), 
                    1, 171, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.918717, 55.591865), 4326), 
                    1, 169, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.91767, 55.591431), 4326), 
                    1, 166, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.917531, 55.591595), 4326), 
                    1, 167, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.917881, 55.591181), 4326), 
                    1, 167, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.917684, 55.591044), 4326), 
                    1, 166, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.91615, 55.591198), 4326), 
                    1, 162, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.915328, 55.591884), 4326), 
                    1, 162, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.91472, 55.592147), 4326), 
                    1, 157, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.914664, 55.592624), 4326), 
                    1, 161, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.91448, 55.592793), 4326), 
                    1, 163, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.913766, 55.592884), 4326), 
                    1, 165, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.912787, 55.592535), 4326), 
                    1, 166, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.912053, 55.591637), 4326), 
                    1, 164, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.910471, 55.590944), 4326), 
                    1, 163, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.909044, 55.593782), 4326), 
                    1, 172, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.908139, 55.594839), 4326), 
                    1, 173, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.908236, 55.594998), 4326), 
                    1, 174, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.908164, 55.595532), 4326), 
                    1, 174, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.907887, 55.596355), 4326), 
                    1, 174, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.906894, 55.597359), 4326), 
                    1, 170, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.906385, 55.597632), 4326), 
                    1, 162, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.90645, 55.597719), 4326), 
                    1, 160, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.905534, 55.597277), 4326), 
                    1, 160, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.904986, 55.597515), 4326), 
                    1, 144, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.904661, 55.597272), 4326), 
                    1, 145, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.904808, 55.597195), 4326), 
                    1, 147, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.904646, 55.59716), 4326), 
                    1, 146, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.904791, 55.597143), 4326), 
                    1, 148, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.904676, 55.597192), 4326), 
                    1, 146, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.904951, 55.597473), 4326), 
                    1, 145, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.905314, 55.597265), 4326), 
                    1, 155, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.905003, 55.597113), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.904887, 55.596874), 4326), 
                    1, 156, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.904084, 55.596529), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.903578, 55.59605), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.902089, 55.595258), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.901598, 55.595234), 4326), 
                    1, 151, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.901015, 55.595566), 4326), 
                    1, 140, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.900129, 55.595578), 4326), 
                    1, 145, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.89834, 55.594597), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.897573, 55.594396), 4326), 
                    1, 148, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.897095, 55.594487), 4326), 
                    1, 146, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.896139, 55.59532), 4326), 
                    1, 144, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.896149, 55.595717), 4326), 
                    1, 144, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.896767, 55.596227), 4326), 
                    1, 144, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.89679, 55.596527), 4326), 
                    1, 146, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.897077, 55.596923), 4326), 
                    1, 146, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.896459, 55.597059), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.896604, 55.597131), 4326), 
                    1, 151, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.89642, 55.597359), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.896093, 55.597386), 4326), 
                    1, 158, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.894294, 55.596985), 4326), 
                    1, 165, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.894405, 55.597288), 4326), 
                    1, 168, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.894735, 55.597448), 4326), 
                    1, 168, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.8953, 55.597459), 4326), 
                    1, 166, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.89546, 55.598298), 4326), 
                    1, 159, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.895952, 55.598787), 4326), 
                    1, 158, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.895934, 55.599393), 4326), 
                    1, 159, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.895003, 55.600093), 4326), 
                    1, 158, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.89389, 55.600482), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.893555, 55.600476), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.893359, 55.600636), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.892864, 55.600418), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.892812, 55.60004), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891829, 55.600045), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891024, 55.600539), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891192, 55.600686), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890969, 55.600607), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.889827, 55.600802), 4326), 
                    1, 151, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.888304, 55.600557), 4326), 
                    1, 155, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.886946, 55.601024), 4326), 
                    1, 151, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.886633, 55.601286), 4326), 
                    1, 148, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.885249, 55.601325), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.884017, 55.600956), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.883359, 55.600309), 4326), 
                    1, 154, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.882444, 55.599932), 4326), 
                    1, 155, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.88257, 55.599797), 4326), 
                    1, 155, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.882449, 55.599717), 4326), 
                    1, 155, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.881187, 55.599501), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.877352, 55.59995), 4326), 
                    1, 142, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.876811, 55.600173), 4326), 
                    1, 142, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.875718, 55.601153), 4326), 
                    1, 132, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.874829, 55.60161), 4326), 
                    1, 118, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.873803, 55.60188), 4326), 
                    1, 113, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.871544, 55.601812), 4326), 
                    1, 112, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.871389, 55.601966), 4326), 
                    1, 112, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.87145, 55.602287), 4326), 
                    1, 111, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.87122, 55.602458), 4326), 
                    1, 111, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.870615, 55.602278), 4326), 
                    1, 111, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.870542, 55.601772), 4326), 
                    1, 112, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.869939, 55.601229), 4326), 
                    1, 111, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.869702, 55.601256), 4326), 
                    1, 111, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.868387, 55.601882), 4326), 
                    1, 111, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.86842, 55.602782), 4326), 
                    1, 111, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.868087, 55.604247), 4326), 
                    1, 109, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.868632, 55.604247), 4326), 
                    1, 110, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.870769, 55.605041), 4326), 
                    1, 111, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.871339, 55.605448), 4326), 
                    1, 112, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.871459, 55.605714), 4326), 
                    1, 110, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.871283, 55.605714), 4326), 
                    1, 110, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.871502, 55.605761), 4326), 
                    1, 110, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.871566, 55.60598), 4326), 
                    1, 111, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.872099, 55.606113), 4326), 
                    1, 112, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.871981, 55.606135), 4326), 
                    1, 112, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.871999, 55.606514), 4326), 
                    1, 111, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.874425, 55.606514), 4326), 
                    1, 113, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.875382, 55.607292), 4326), 
                    1, 117, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.877641, 55.607308), 4326), 
                    1, 132, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.879654, 55.607864), 4326), 
                    1, 146, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.880422, 55.608591), 4326), 
                    1, 144, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.881578, 55.608851), 4326), 
                    1, 146, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.881616, 55.609004), 4326), 
                    1, 143, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.881311, 55.609184), 4326), 
                    1, 138, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.881503, 55.609699), 4326), 
                    1, 136, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.882554, 55.610019), 4326), 
                    1, 140, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.882971, 55.610647), 4326), 
                    1, 146, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.883655, 55.611257), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.884438, 55.611702), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.884422, 55.612299), 4326), 
                    1, 154, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.885164, 55.613112), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.886441, 55.613739), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.887393, 55.614398), 4326), 
                    1, 151, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.887598, 55.614688), 4326), 
                    1, 151, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.887641, 55.615075), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.887313, 55.615419), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890234, 55.615491), 4326), 
                    1, 157, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891048, 55.615864), 4326), 
                    1, 156, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.89119, 55.61948), 4326), 
                    1, 171, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890901, 55.620437), 4326), 
                    1, 171, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891002, 55.620555), 4326), 
                    1, 171, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890688, 55.620695), 4326), 
                    1, 172, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890952, 55.62094), 4326), 
                    1, 173, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890965, 55.621651), 4326), 
                    1, 174, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891165, 55.622248), 4326), 
                    1, 172, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890913, 55.623225), 4326), 
                    1, 168, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891126, 55.623745), 4326), 
                    1, 167, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891012, 55.624005), 4326), 
                    1, 165, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891184, 55.625019), 4326), 
                    1, 165, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890879, 55.6255), 4326), 
                    1, 167, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890906, 55.626116), 4326), 
                    1, 171, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891129, 55.626558), 4326), 
                    1, 169, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890987, 55.626812), 4326), 
                    1, 170, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891131, 55.627771), 4326), 
                    1, 173, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890998, 55.628656), 4326), 
                    1, 172, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891157, 55.629452), 4326), 
                    1, 172, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891056, 55.629597), 4326), 
                    1, 171, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891143, 55.632462), 4326), 
                    1, 160, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890993, 55.633013), 4326), 
                    1, 156, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.891049, 55.634619), 4326), 
                    1, 157, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.890671, 55.635055), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.889996, 55.635255), 4326), 
                    1, 145, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.887961, 55.635137), 4326), 
                    1, 145, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.887272, 55.635273), 4326), 
                    1, 137, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.886813, 55.635123), 4326), 
                    1, 149, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.88646, 55.635264), 4326), 
                    1, 138, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.882407, 55.635374), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.88182, 55.635568), 4326), 
                    1, 147, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.881628, 55.63538), 4326), 
                    1, 153, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.881059, 55.63547), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.880189, 55.635227), 4326), 
                    1, 161, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.879465, 55.6352), 4326), 
                    1, 161, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.879368, 55.635382), 4326), 
                    1, 151, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.878669, 55.635379), 4326), 
                    1, 150, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.876077, 55.634981), 4326), 
                    1, 157, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.875606, 55.635024), 4326), 
                    1, 155, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.875643, 55.63538), 4326), 
                    1, 144, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.87447, 55.635804), 4326), 
                    1, 144, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.873919, 55.636345), 4326), 
                    1, 138, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.870091, 55.636192), 4326), 
                    1, 139, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.869543, 55.636116), 4326), 
                    1, 139, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.868594, 55.635613), 4326), 
                    1, 140, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.866944, 55.635105), 4326), 
                    1, 140, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.862093, 55.634087), 4326), 
                    1, 140, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.861591, 55.633827), 4326), 
                    1, 140, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.861128, 55.633317), 4326), 
                    1, 144, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.861036, 55.633108), 4326), 
                    1, 145, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.861192, 55.632701), 4326), 
                    1, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    8, ST_SetSRID(ST_MakePoint(37.86107, 55.632366), 4326), 
                    1, 155, 0.0
                );
COMMIT;
