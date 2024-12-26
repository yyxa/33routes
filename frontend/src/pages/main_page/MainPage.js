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
import CollectionCard from '../../components/collection_card/collectionCard';
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
  {
    id: 2,
    name: "Исторические памятники",
    description: "Прогулка по историческим местам центра Москвы, включая Красную площадь и Собор Василия Блаженного.",
    distance: "3 км",
    duration: "1.5 часа",
    rating: 4.8,
    latitude: 55.7539,
    longitude: 37.6208,
    images: ["./image5.jpg", "image6.jpg"],
  },
  {
    id: 3,
    name: "Вдоль набережной",
    description: "Маршрут вдоль Москвы-реки, проходящий через Парк Горького и Нескучный сад.",
    distance: "4 км",
    duration: "2 часа",
    rating: 4.7,
    latitude: 55.7352,
    longitude: 37.5954,
    images: ["./image7.jpg", "image8.jpg", "image9.jpg"],
  },
  {
    id: 4,
    name: "Парки и скверы",
    description: "Экскурсия по красивым зеленым зонам, включая Сокольники и Лосиный остров.",
    distance: "5 км",
    duration: "2.5 часа",
    rating: 4.6,
    latitude: 55.8088,
    longitude: 37.6663,
    images: ["./image10.jpg", "image11.jpg"],
  },
  {
    id: 5,
    name: "Культурный центр",
    description: "Прогулка по музеям и галереям, включая Третьяковскую галерею и Политехнический музей.",
    distance: "2.5 км",
    duration: "1.5 часа",
    rating: 4.9,
    latitude: 55.7414,
    longitude: 37.6208,
    images: ["./image12.jpg", "image13.jpg", "image14.jpg"],
  },
  {
    id: 6,
    name: "Арт-пространства",
    description: "Исследуйте лучшие арт-кластеры Москвы, включая Винзавод и Артплей.",
    distance: "3.5 км",
    duration: "2 часа",
    rating: 4.5,
    latitude: 55.7616,
    longitude: 37.6577,
    images: ["./image15.jpg", "image16.jpg"],
  },
  {
    id: 7,
    name: "Магазины и рынки",
    description: "Маршрут по уникальным магазинам и рынкам, включая ГУМ и Даниловский рынок.",
    distance: "3 км",
    duration: "1.5 часа",
    rating: 4.8,
    latitude: 55.7502,
    longitude: 37.6225,
    images: ["./image17.jpg", "image18.jpg"],
  },
  {
    id: 8,
    name: "Знаменитые улицы",
    description: "Прогулка по старинным улицам Москвы, включая Арбат и Никольскую улицу.",
    distance: "4 км",
    duration: "2 часа",
    rating: 4.7,
    latitude: 55.7520,
    longitude: 37.6108,
    images: ["./image19.jpg", "image20.jpg"],
  },
  {
    id: 9,
    name: "Ночная Москва",
    description: "Ночной маршрут по ярким огням города, включая мост Багратион и небоскребы Москва-Сити.",
    distance: "6 км",
    duration: "3 часа",
    rating: 5.0,
    latitude: 55.7470,
    longitude: 37.5394,
    images: ["./image21.jpg", "image22.jpg", "image23.jpg"],
  },
];

const collectionData = [
  {
    id: 1,
    title: "Культурные памятники",
    description: "Коллекция культурных памятников Москвы.",
    routesCount: 5,
    averageRating: 4.7,
    routes: ["Городской оазис", "Исторические памятники"],
    images: ["./img1.jpg", "./img2.jpg", "./img3.jpg"],
  },
  {
    id: 2,
    title: "Парки и скверы",
    description: "Коллекция красивых парков города.",
    routesCount: 7,
    averageRating: 4.5,
    routes: ["Вдоль набережной", "Сокольники"],
    images: [],
  },
];

const MainPage = () => {
  const [activeRouteButton, setActiveRouteButton] = useState('МАРШРУТЫ');
  const [activeSortButton, setActiveSortButton] = useState('');
  const mapContainerRef = useRef(null);

  useEffect(() => {
    if (mapContainerRef.current) {
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
      marker.setStyle(
        new Style({
          image: new Icon({
            src: 'https://openlayers.org/en/v4.6.5/examples/data/icon.png',
            scale: 0.05,
          }),
        })
      );

      const vectorSource = new VectorSource({
        features: [marker],
      });

      const vectorLayer = new VectorLayer({
        source: vectorSource,
      });

      map.addLayer(vectorLayer);
    }
  }, []);

  useEffect(() => {
    const handleDocumentClick = (event) => {
      const target = event.target;
      if (!target.closest('.sort-filter-container')) {
        setActiveSortButton('');
      }
    };

    document.addEventListener('click', handleDocumentClick);

    return () => {
      document.removeEventListener('click', handleDocumentClick);
    };
  }, []);

  const handleRouteButtonClick = (buttonType) => {
    if (buttonType === 'МАРШРУТЫ' || buttonType === 'ПОДБОРКИ') {
      setActiveRouteButton(buttonType);
    }
  };

  const handleSortButtonClick = (buttonType) => {
    setActiveSortButton((prev) => (prev === buttonType ? '' : buttonType));
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
              ))}
            {activeRouteButton === 'ПОДБОРКИ' &&
              collectionData.map((collection, index) => (
                <CollectionCard
                  key={index}
                  title={collection.title}
                  description={collection.description}
                  routesCount={collection.routesCount}
                  averageRating={collection.averageRating}
                  routes={collection.routes}
                />
              ))}
          </div>
        </div>

        <div className="right-panel">
          <div
            ref={mapContainerRef}
            className="leaflet-container"
            style={{
              width: '100%',
              height: '100%',
            }}
          ></div>
        </div>
      </div>
    </div>
  );
};

export default MainPage;
