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
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);

  // Добавляем новые состояния
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);

  useEffect(() => {
    if (activeRouteButton === 'МАРШРУТЫ') {
      setRoutes([]);
      setCurrentPage(1);
      fetchRoutes(1);
    }
  }, [activeRouteButton]);

  const fetchRoutes = async (page = 1, perPage = 5) => {
    if (loading || !hasMore) return;
    setLoading(true);
    
    try {
      const res = await fetch(`http://localhost:8100/api/route/routes?pagination-page-number=${page}&pagination-per-page=${perPage}`);
      
      if (!res.ok) {
        throw new Error(`HTTP error! status: ${res.status}`);
      }
      
      const data = await res.json();
      
      // Получаем заголовки пагинации из ответа
      const currentPage = parseInt(res.headers.get('pagination-current-page')) || 1;
      const totalPages = parseInt(res.headers.get('pagination-total-pages')) || 1;
      
      const routePromises = data.routes.map(async (id) => {
        const detailRes = await fetch(`http://localhost:8100/api/route/route/${id}`);
        return detailRes.json();
      });

      const newRoutes = await Promise.all(routePromises);
      
      setRoutes(prev => [
        ...prev, 
        ...newRoutes.filter(r => !prev.some(existing => existing.id === r.route.route_id))
                   .map(r => ({
                      id: r.route.route_id,
                      name: r.route.name,
                      description: r.route.description,
                      distance: r.route.distance,
                      duration: r.route.duration,
                      rating: r.route.rating,
                      images: r.route.images || [],
                    }))
      ]);

      setCurrentPage(currentPage);
      setTotalPages(totalPages);
      setHasMore(currentPage < totalPages);
      
    } catch (err) {
      console.error('Ошибка загрузки маршрутов:', err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    const handleScroll = () => {
      const scrollTop = window.scrollY || document.documentElement.scrollTop;
      const scrollHeight = document.documentElement.scrollHeight;
      const clientHeight = document.documentElement.clientHeight;

      console.log('Scroll position:', scrollTop);
      console.log('Total height:', scrollHeight);
      console.log('Client height:', clientHeight);
      console.log('Loading:', loading);
      console.log('Has more:', hasMore);

      if (scrollTop + clientHeight >= scrollHeight - 5 && !loading && hasMore) {
        console.log('Fetching next page:', currentPage + 1);
        fetchRoutes(currentPage + 1);
      }
    };

    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, [loading, hasMore, currentPage]);

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
            {routes.map((r, index) => (
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

        {loading && <div className="loading-indicator">Загрузка...</div>}
        {!hasMore && <div className="end-message">Вы достигли конца списка</div>}
      </div>
    </div>
  );
};

export default SearchPage;
