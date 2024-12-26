import React, { useEffect, useRef } from 'react';
import { Outlet } from 'react-router-dom';
import Header from '../components/header/header'; // Импортируем Header
import 'ol/ol.css';
import { Map, View } from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import { fromLonLat } from 'ol/proj';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import Feature from 'ol/Feature';
import Point from 'ol/geom/Point';
import { Style, Icon } from 'ol/style';

import './RootLayout.css';

const RootLayout = ({ user, onLoginClick, onLogoutClick }) => {
  const mapContainerRef = useRef(null);
  const mapRef = useRef(null);

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

      // Пример: добавим маркер Москвы
      const vectorSrc = new VectorSource();
      const vectorLayer = new VectorLayer({ source: vectorSrc });
      map.addLayer(vectorLayer);

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
          <Outlet />
        </div>
        <div className="right-block">
          <div ref={mapContainerRef} className="map-container" />
        </div>
      </div>
    </div>
  );
};

export default RootLayout;
