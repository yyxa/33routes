import React, { useEffect, useRef, useState } from 'react';
import { Helmet } from 'react-helmet-async';
import 'ol/ol.css'; // Стили для OpenLayers
import { Map, View } from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import { fromLonLat } from 'ol/proj';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import Feature from 'ol/Feature';
import Point from 'ol/geom/Point';
import { Style, Icon } from 'ol/style';

import './MainPage.css';
import SearchBar from "../../components/search_bar/searchBar";
import Button from '../../components/buttons/button';
import RouteCard from '../../components/route_card/routeCard';
import Header from '../../components/header/header';

const routeData = [
  {
    id: 1,
    name: "Городской оазис",
    description: "Маршрут начинается у метро Чеховская и ведет в парк Сад Эрмитаж. Вы пройдете через цветочные арки.",
    distance: "2 км",
    duration: "1 час",
    rating: 4.9,
    latitude: 55.7558,
    longitude: 37.6173,
    images: ["./image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg"],
  },
];

const collectionData = [
  {
    id: 1,
    name: "Музеи Москвы",
    description: "Коллекция музеев Москвы",
    items: 5,
    images: ["museum1.jpg", "museum2.jpg"],
  },
  {
    id: 2,
    name: "Лучшие парки",
    description: "Подборка популярных парков для прогулок",
    items: 7,
    images: ["park1.jpg", "park2.jpg"],
  },
];

const MainPage = () => {
  const [activeRouteButton, setActiveRouteButton] = useState('МАРШРУТЫ');
  const [activeSortButton, setActiveSortButton] = useState('');
  
  const mapContainerRef = useRef(null);

useEffect(() => {
  if (mapContainerRef.current) {
    console.log('Container size:', mapContainerRef.current.offsetWidth, mapContainerRef.current.offsetHeight);

    const map = new Map({
      target: mapContainerRef.current,
      layers: [
        new TileLayer({
          source: new OSM(),
        }),
      ],
      view: new View({
        center: fromLonLat([37.6173, 55.7558]),
        zoom: 12,
      }),
    });

    const marker = new Feature({
      geometry: new Point(fromLonLat([37.6173, 55.7558])),
    });
    marker.setStyle(new Style({
      image: new Icon({
        src: 'https://openlayers.org/en/v4.6.5/examples/data/icon.png',
        scale: 0.05,
      }),
    }));

    const vectorSource = new VectorSource({
      features: [marker],
    });

    const vectorLayer = new VectorLayer({
      source: vectorSource,
    });

    map.addLayer(vectorLayer);
  }
}, []);


  const handleRouteButtonClick = (buttonType) => {
    setActiveRouteButton(buttonType);
  };

  const handleSortButtonClick = (buttonType) => {
    setActiveSortButton(buttonType);
  };

  return (
    <div className="main-container">
      <Helmet>
        <title>33routes - Главная страница</title>
      </Helmet>
      <Header />

      <div className="divider"></div>

      <div className="content">
        <div className="left-panel">
          <SearchBar />

          <div className="button-groups">
            <div className="type-button-container">
              <Button
                label="МАРШРУТЫ"
                variant={activeRouteButton === 'МАРШРУТЫ' ? 'dark' : 'white'}
                onClick={() => handleRouteButtonClick('МАРШРУТЫ')}
              />
              <Button
                label="ПОДБОРКИ"
                variant={activeRouteButton === 'ПОДБОРКИ' ? 'dark' : 'white'}
                onClick={() => handleRouteButtonClick('ПОДБОРКИ')}
              />
            </div>

            <div className="sort-filter-container">
              <Button
                label="СОРТИРОВАТЬ"
                variant={activeSortButton === 'СОРТИРОВАТЬ' ? 'dark' : 'white'}
                onClick={() => handleSortButtonClick('СОРТИРОВАТЬ')}
              />
              <Button
                label="ФИЛЬТРЫ"
                variant={activeSortButton === 'ФИЛЬТРЫ' ? 'dark' : 'white'}
                onClick={() => handleSortButtonClick('ФИЛЬТРЫ')}
              />
            </div>
          </div>

          <div className="route-list">
            {activeRouteButton === 'МАРШРУТЫ' &&
              routeData.map((route) => (
                <RouteCard
                  key={route.id}
                  name={route.name}
                  description={route.description}
                  distance={route.distance}
                  duration={route.duration}
                  rating={route.rating}
                  images={route.images}
                />
              ))
            }
          </div>
        </div>

        <div className="right-panel">
          {/* Контейнер для карты */}
          <div ref={mapContainerRef} className="leaflet-container"></div>
        </div>
      </div>
    </div>
  );
};

export default MainPage;
