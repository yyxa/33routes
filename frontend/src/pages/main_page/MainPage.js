import React, { useState } from 'react';
import './MainPage.css';
import { Helmet } from 'react-helmet-async';

import SearchBar from "../../components/search_bar/searchBar";
import Button from '../../components/buttons/button';
import RouteCard from '../../components/route_card/routeCard';
import CommentCard from '../../components/comment_card/commentCard';
import Header from '../../components/header/header'

const routeData = [
  {
    id: 1,
    name: "Городской оазис",
    description: "Маршрут начинается у метро Чеховская и ведет в парк Сад Эрмитаж. Вы пройдете через цветочные арки.",
    distance: "2 км",
    duration: "1 час",
    rating: 4.9,
    images: ["./image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg"],
  },
  {
    id: 2,
    name: "Все сувениры",
    description: "Маршрут по магазинам города, где можно приобрести уникальные сувениры и подарки.",
    distance: "4 км",
    duration: "38 минут",
    rating: 4.7,
    images: ["image5.jpg", "image6.jpg", "image7.jpg", "image8.jpg"],
  },
  {
    id: 3,
    name: "По следам историков",
    description: "Экскурсия по старым зданиям и памятникам города, где вы узнаете удивительные истории.",
    distance: "5 км",
    duration: "2 часа",
    rating: 4.8,
    images: ["image9.jpg", "image10.jpg", "image11.jpg"],
  },
  {
    id: 4,
    name: "Парки и прудики",
    description: "Маршрут по самым живописным паркам города с великолепными прудами и аллеями.",
    distance: "3 км",
    duration: "1.5 часа",
    rating: 4.5,
    images: ["image12.jpg", "image13.jpg"],
  },
  {
    id: 5,
    name: "Река и мосты",
    description: "Прогулка вдоль реки, через старинные мосты, с остановками на смотровых площадках.",
    distance: "6 км",
    duration: "2.5 часа",
    rating: 4.6,
    images: ["image14.jpg", "image15.jpg", "image16.jpg", "image17.jpg"],
  },
  {
    id: 6,
    name: "Театральная площадь",
    description: "Маршрут через театральную площадь города, знакомство с историей театров и культурных заведений.",
    distance: "1.5 км",
    duration: "45 минут",
    rating: 4.2,
    images: ["image18.jpg", "image19.jpg"],
  },
  {
    id: 7,
    name: "Морской бриз",
    description: "Прогулка по набережной с видом на море и старые морские башни.",
    distance: "7 км",
    duration: "3 часа",
    rating: 4.9,
    images: ["image20.jpg", "image21.jpg", "image22.jpg"],
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

            {/* {activeRouteButton === 'ПОДБОРКИ' &&
              collectionData.map((collection) => (
                <CollectionCard
                  key={collection.id}
                  name={collection.name}
                  description={collection.description}
                  items={collection.items}
                  images={collection.images}
                />
              ))
            } */}
          </div>
        </div>

        <div className="right-panel">
          {/* <CommentCard
            commentData="чтото"
          /> */}
        </div>
      </div>
    </div>
  );
};

export default MainPage;
