// src/pages/search_page/SearchPage.jsx

import React, { useEffect, useState } from 'react';
import { Helmet } from 'react-helmet-async';
import { useNavigate } from 'react-router-dom';

import SearchBar from '../../components/search_bar/searchBar';
import Button from '../../components/buttons/button';
import RouteCard from '../../components/route_card/routeCard';
import CollectionCard from '../../components/collection_card/collectionCard';

import './SearchPage.css'; // Стили, если нужно

const SearchPage = () => {
  const navigate = useNavigate();

  // По дефолту показываем "МАРШРУТЫ"
  const [activeRouteButton, setActiveRouteButton] = useState('МАРШРУТЫ');
  const [activeSortButton, setActiveSortButton] = useState('');

  const [routes, setRoutes] = useState([]);
  const [collections, setCollections] = useState([]);

  useEffect(() => {
    // При загрузке страницы — подгружаем список маршрутов
    // (или сразу и маршруты, и подборки)
    const fetchData = async () => {
      try {
        // 1) Список маршрутов
        const routesRes = await fetch('http://33routes.ru/api/route/routes');
        const routesData = await routesRes.json();
        const routeIds = routesData.routes || [];

        const routePromises = routeIds.map(async (id) => {
          const detailRes = await fetch(`http://33routes.ru/api/route/route/${id}`);
          const detailData = await detailRes.json();
          const { route } = detailData;
          return {
            id: route.route_id,
            name: route.name,
            description: route.description,
            distance: route.distance, // Убедитесь, что это поле существует
            duration: route.duration, // Убедитесь, что это поле существует
            rating: route.rating, // Убедитесь, что это поле существует
            images: route.images, // Убедитесь, что это поле существует
          };
        });
        const routesResult = await Promise.all(routePromises);
        setRoutes(routesResult);

        // 2) Список подборок (если нужно)
        const collRes = await fetch('http://33routes.ru/api/collection/collections');
        const collData = await collRes.json(); // { collections: [1,2,3,...] }
        const collIds = collData.collections || [];
        const collPromises = collIds.map(async (cId) => {
          const cRes = await fetch(`http://33routes.ru/api/collection/collection/${cId}`);
          const cJson = await cRes.json();
          // cJson содержит информацию о подборке
          return {
            id: cJson.collection.collection_id,
            title: cJson.collection.name, // Убедитесь, что это поле существует
            description: cJson.collection.description, // Убедитесь, что это поле существует
            routesCount: cJson.collection.routes.length, // Пример, как получить количество маршрутов
            averageRating: cJson.collection.average_rating, // Убедитесь, что это поле существует
            routes: cJson.collection.routes, // Убедитесь, что это поле существует
          };
        });
        const collectionsResult = await Promise.all(collPromises);
        setCollections(collectionsResult);

      } catch (err) {
        console.error('Ошибка при загрузке данных:', err);
      }
    };

    fetchData();
  }, []);

  // Сброс активных кнопок при клике вне сортировки (пример)
  useEffect(() => {
    const handleDocumentClick = (event) => {
      if (!event.target.closest('.sort-filter-container')) {
        setActiveSortButton('');
      }
    };
    document.addEventListener('click', handleDocumentClick);
    return () => document.removeEventListener('click', handleDocumentClick);
  }, []);

  // Клики на кнопки
  const handleRouteButtonClick = (buttonType) => {
    setActiveRouteButton(buttonType);
  };

  const handleSortButtonClick = (buttonType) => {
    setActiveSortButton((prev) => (prev === buttonType ? '' : buttonType));
  };

  // При клике на маршрут — переходим на /route/{id}
  const handleOpenRouteDetail = (routeId) => {
    navigate(`/route/${routeId}`);
  };

  // При клике на подборку — /collection/{id}
  const handleOpenCollectionDetail = (collectionId) => {
    navigate(`/collection/${collectionId}`);
  };

  return (
    <div className="search-page">
      <Helmet>
        <title>33routes - Поиск</title>
      </Helmet>

      {/* Поиск */}
      <SearchBar />

      {/* Кнопки «МАРШРУТЫ» / «ПОДБОРКИ» */}
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

      {/* Список маршрутов или подборок */}
      <div className="list-content">
        {activeRouteButton === 'МАРШРУТЫ' && (
          <div className="route-list">
            {routes.map((r) => (
              <RouteCard
                key={r.id}
                id={r.id}
                name={r.name}
                description={r.description}
                distance={r.distance}
                duration={r.duration}
                rating={r.rating}
                images={r.images}
                // при клике – переходим на /route/ID
                onOpenRouteDetail={handleOpenRouteDetail}
              />
            ))}
          </div>
        )}

        {activeRouteButton === 'ПОДБОРКИ' && (
          <div className="collection-list">
            {collections.map((collection, index) => (
              <CollectionCard
                key={index}
                title={collection.title}
                description={collection.description}
                routesCount={collection.routesCount}
                averageRating={collection.averageRating}
                routes={collection.routes || []}
              />
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

export default SearchPage;
