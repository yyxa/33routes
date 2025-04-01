import React, { useEffect, useRef, useState } from 'react';
import { Outlet } from 'react-router-dom';
import Header from '../components/header/header'; 
import 'ol/ol.css';
import { Map, View } from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import { fromLonLat } from 'ol/proj';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import Feature from 'ol/Feature';
import Point from 'ol/geom/Point';
import LineString from 'ol/geom/LineString';
import { Style, Stroke, Icon } from 'ol/style'; 

import './RootLayout.css';

const RootLayout = ({ user, onLoginClick, onLogoutClick, selectedRoute }) => {
  const mapContainerRef = useRef(null);
  const mapRef = useRef(null);
  const vectorLayerRef = useRef(null);

  const [visibleRoutes, setVisibleRoutes] = useState([]);

  useEffect(() => {
    // Инициализация карты
    if (!mapRef.current && mapContainerRef.current) {
      const map = new Map({
        target: mapContainerRef.current,
        layers: [
          new TileLayer({ source: new OSM() }),
        ],
        view: new View({
          center: fromLonLat([37.6173, 55.7558]),
          zoom: 12,
        }),
      });
      mapRef.current = map;

      
      const overlayDiv = document.createElement('div');
      overlayDiv.id = 'image-overlay';
      overlayDiv.style.position = 'absolute';
      overlayDiv.style.pointerEvents = 'none';
      overlayDiv.style.display = 'none';
      overlayDiv.style.zIndex = 1000;
      overlayDiv.style.border = '2px solid white';
      overlayDiv.style.boxShadow = '0 2px 8px rgba(0,0,0,0.2)';
      overlayDiv.style.borderRadius = '6px';
      overlayDiv.style.overflow = 'hidden';
      overlayDiv.style.width = '150px';
      overlayDiv.style.height = '100px';
      document.body.appendChild(overlayDiv);

      map.on('pointermove', function (evt) {
        const pixel = map.getEventPixel(evt.originalEvent);
        const feature = map.forEachFeatureAtPixel(pixel, f => f);

        if (feature && feature.get('image')) {
          const imageUrl = feature.get('image');
          overlayDiv.innerHTML = `<img src="${imageUrl}" style="width: 100%; height: 100%; object-fit: cover;" />`;
          const coordinate = feature.getGeometry().getCoordinates();
          const [x, y] = map.getPixelFromCoordinate(coordinate);
          overlayDiv.style.left = `${x - 75}px`; // центрируем по X
          overlayDiv.style.top = `${y - 120}px`; // поднимаем вверх над маркером          
          overlayDiv.style.display = 'block';
        } else {
          overlayDiv.style.display = 'none';
        }
      });
const vectorSrc = new VectorSource();
      const vectorLayer = new VectorLayer({ 
        source: vectorSrc 
      });
      map.addLayer(vectorLayer);

      mapRef.current = map;
      
      overlayDiv.id = 'image-overlay';
      overlayDiv.style.position = 'absolute';
      overlayDiv.style.pointerEvents = 'none';
      overlayDiv.style.display = 'none';
      overlayDiv.style.zIndex = 1000;
      overlayDiv.style.border = '2px solid white';
      overlayDiv.style.boxShadow = '0 2px 8px rgba(0,0,0,0.2)';
      overlayDiv.style.borderRadius = '6px';
      overlayDiv.style.overflow = 'hidden';
      overlayDiv.style.width = '150px';
      overlayDiv.style.height = '100px';
      document.body.appendChild(overlayDiv);

      map.on('pointermove', function (evt) {
        const pixel = map.getEventPixel(evt.originalEvent);
        const feature = map.forEachFeatureAtPixel(pixel, f => f);
      
        if (feature && feature.get('image')) {
          const imageUrl = feature.get('image');
          overlayDiv.innerHTML = `<img src="${imageUrl}" />`;
          const coordinate = evt.coordinate;
          const [x, y] = map.getPixelFromCoordinate(coordinate);
      
          overlayDiv.style.left = `${x + 10}px`;
          overlayDiv.style.top = `${y - 110}px`;
          overlayDiv.style.display = 'block';
        } else {
          overlayDiv.style.display = 'none';
        }
      });      
vectorLayerRef.current = vectorLayer;

      const marker = new Feature({
        geometry: new Point(fromLonLat([37.6173, 55.7558])),
      });
      marker.setStyle(
        new Style({
          image: new Icon({
            src: 'https://openlayers.org/en/v4.6.5/examples/data/icon.png',
            scale: 0.05,
          }),
        })
      );
      vectorSrc.addFeature(marker);
    }
  }, []);

  useEffect(() => {
    if (!selectedRoute || !vectorLayerRef.current) return;

    const vectorSource = new VectorSource();
    const points = selectedRoute.points.map(p =>
      fromLonLat([p.coordinate.longitude, p.coordinate.latitude])
    );

    if (points.length > 1) {
      const routeFeature = new Feature(new LineString(points));
      routeFeature.setStyle(new Style({}));
      vectorSource.addFeature(routeFeature);
    }
    vectorLayerRef.current.setSource(vectorSource);
  }, [selectedRoute]);

  const toggleRouteOnMap = async (routeId) => {

    if (!vectorLayerRef.current) return;

    const vectorSource = vectorLayerRef.current.getSource();

    if (visibleRoutes.includes(routeId)) {
      vectorSource.getFeatures().forEach(feature => {
        if (feature.get('routeId') === routeId) {
          vectorSource.removeFeature(feature);
        }
      });
      setVisibleRoutes(prevRoutes => prevRoutes.filter(id => id !== routeId));
    } else {
      try {
        const response = await fetch(`http://localhost:8100/api/route/route/${routeId}`);
        const data = await response.json();

        if (!data.points || data.points.length < 2) {
          console.error(`⚠️ Ошибка: маршрут ${routeId} содержит ${data.points.length} точку(и). Нужны минимум 2!`);
          return;
        }

        const filteredPoints = data.points.filter(p =>
          p.coordinate.latitude > 50 && p.coordinate.latitude < 60 &&
          p.coordinate.longitude > 30 && p.coordinate.longitude < 40
        );

        const sortedPoints = filteredPoints.sort((a, b) => a.time_offset - b.time_offset);

        const points = sortedPoints.map(p =>
          fromLonLat([p.coordinate.longitude, p.coordinate.latitude])
        );

        const startMarker = new Feature(new Point(points[0]));
        startMarker.setStyle(new Style({
          image: new Icon({
            src: 'https://maps.google.com/mapfiles/ms/icons/green-dot.png',
            scale: 1,
          }),
        }));
        startMarker.set('routeId', routeId);
        vectorSource.addFeature(startMarker);

        const endMarker = new Feature(new Point(points[points.length - 1]));
        endMarker.setStyle(new Style({
          image: new Icon({
            src: 'https://maps.google.com/mapfiles/ms/icons/red-dot.png',
            scale: 1,
          }),
        }));
        endMarker.set('routeId', routeId);
        vectorSource.addFeature(endMarker);

        if (points.length > 1) {
          const routeFeature = new Feature(new LineString(points));
          routeFeature.setStyle(new Style({
            stroke: new Stroke({ color: 'orange', width: 7 }),
          }));
          routeFeature.set('routeId', routeId);
          vectorSource.addFeature(routeFeature);
        }

        if (mapRef.current && points.length > 0) {
          mapRef.current.getView().animate({
            center: points[0],
            duration: 600,
            zoom: 15, 
          });
        }

        setVisibleRoutes(prevRoutes => [...prevRoutes, routeId]);

        data.points
          .filter(p => p.images && p.images.length > 0)
          .forEach(p => {
            const coord = fromLonLat([p.coordinate.longitude, p.coordinate.latitude]);
            const feature = new Feature(new Point(coord));
            feature.setStyle(
              new Style({
                image: new Icon({
                  src: 'https://maps.google.com/mapfiles/ms/icons/blue-dot.png',
                  scale: 1,
                }),
              })
            );
            feature.set('image', `http://localhost:8100/api/media/image/${p.images[0]}`);
        feature.set('routeId', routeId);
            vectorSource.addFeature(feature);
        });

      } catch (error) {
        console.error('❌ Ошибка загрузки маршрута:', error);
      }
    }
  };

  const clearAllRoutes = () => {
    if (vectorLayerRef.current) {
      const source = vectorLayerRef.current.getSource();
      source.clear();
    }
    setVisibleRoutes([]);
  };

  return (
    <div className="root-layout">
      {/* Шапка сверху */}
      <Header 
        user={user} 
        onLoginClick={onLoginClick} 
        onLogoutClick={onLogoutClick} 
      />

      {/* Две колонки ниже шапки */}
      <div className="content">
        <div className="left-block">
          <Outlet context={{ toggleRouteOnMap, clearAllRoutes }} /> {/* Передаём функцию в Outlet */}
        </div>
        <div className="right-block">
          <div ref={mapContainerRef} className="map-container" />
        </div>
      </div>
    </div>
  );
};

export default RootLayout;
