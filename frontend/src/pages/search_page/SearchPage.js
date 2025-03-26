// src/pages/search_page/SearchPage.jsx

import React, { useEffect, useState, useCallback } from 'react';
import { Helmet } from 'react-helmet-async';
import { useNavigate } from 'react-router-dom';
import _ from 'lodash';
import { useOutletContext } from 'react-router-dom';

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

  const { clearAllRoutes } = useOutletContext();


  const fetchRoutes = useCallback(async (page = 1, perPage = 5) => {
    console.log('Начало fetchRoutes, страница:', page);
    
    if (loading) {
      console.log('Загрузка остановлена - идёт предыдущая загрузка');
      return;
    }
    
    setLoading(true);
    
    try {
      console.log('Отправка запроса для страницы:', page);
      const res = await fetch(`http://localhost:8100/api/route/routes?pagination-page-number=${page}&pagination-per-page=${perPage}`);
      
      if (!res.ok) {
        throw new Error(`HTTP error! status: ${res.status}`);
      }
      
      const data = await res.json();
      console.log('Получены данные:', data);
      
      const currentPage = parseInt(res.headers.get('pagination-current-page')) || 1;
      const totalPages = parseInt(res.headers.get('pagination-total-pages')) || 1;
      
      console.log('Заголовки пагинации:', { currentPage, totalPages });
      
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
                      distance: r.route.length,
                      duration: r.route.duration,
                      rating: r.route.rating,
                      images: (r.route.images || []).map(name => `http://localhost:8100/api/media/image/${name}`),
                      authorImage: r.user.image_url
                      ? `http://localhost:8100/api/media/image/${r.user.image_url}`
                      : 'http://localhost:8100/api/media/image/default-avatar.svg', // если пусто — подставляется заглушка
                    }))
      ]);
  
      setCurrentPage(currentPage);
      setTotalPages(totalPages);
      setHasMore(data.routes.length > 0);
      
    } catch (err) {
      console.error('Ошибка загрузки маршрутов:', err);
    } finally {
      setLoading(false);
    }
  }, [loading]);

  const fetchCollections = useCallback(async (page = 1, perPage = 5) => {
    if (loading) {
      console.log('Загрузка остановлена - идёт предыдущая загрузка');
      return;
    }
    
    setLoading(true);
    console.log('Начало загрузки подборок, страница:', page);
    
    try {
      const res = await fetch(`http://localhost:8100/api/collection/collections?pagination-page-number=${page}&pagination-per-page=${perPage}`);
      
      if (!res.ok) {
        throw new Error(`HTTP error! status: ${res.status}`);
      }
      
      const data = await res.json();
      console.log('Получены данные подборок:', data);
      
      const collectionPromises = data.collections.map(async (id) => {
        const detailRes = await fetch(`http://localhost:8100/api/collection/collection/${id}`);
        const collectionData = await detailRes.json();
        
        const routePromises = collectionData.collection.routes.ids.map(async (routeId) => {
          const routeRes = await fetch(`http://localhost:8100/api/route/route/${routeId}`);
          const routeData = await routeRes.json();
          return {
            name: routeData.route.name,
            length: routeData.route.length,
            duration: routeData.route.duration,
            rating: routeData.route.rating
          };
        });

        const routesDetails = await Promise.all(routePromises);
        
        // Вычисляем общую длину маршрутов
        const totalLength = routesDetails.reduce((sum, route) => sum + route.length, 0);
        
        return {
          id: collectionData.collection.collection_id,
          name: collectionData.collection.name,
          description: collectionData.collection.description,
          tags: collectionData.collection.tags,
          rating: collectionData.collection.rating,
          routesCount: collectionData.collection.routes.amount,
          routes: routesDetails,
          length: totalLength // Добавляем общую длину
        };
      });

      const newCollections = await Promise.all(collectionPromises);
      
      setCollections(prev => [
        ...prev, 
        ...newCollections.filter(c => !prev.some(existing => existing.id === c.id))
      ]);

      setCurrentPage(page);
      setHasMore(data.collections.length > 0);
      
    } catch (err) {
      console.error('Ошибка загрузки подборок:', err);
    } finally {
      setLoading(false);
    }
  }, [loading]);

  useEffect(() => {
    clearAllRoutes?.();
    if (activeRouteButton === 'МАРШРУТЫ') {
      setRoutes([]);
      setCurrentPage(1);
      fetchRoutes(1);
    } else if (activeRouteButton === 'ПОДБОРКИ') {
      setCollections([]);
      setCurrentPage(1);
      fetchCollections(1);
    }
  }, [activeRouteButton]);

  useEffect(() => {
    const leftBlock = document.querySelector('.left-block');
    
    const handleScroll = () => {
      if (!leftBlock) return;
      
      const scrollTop = leftBlock.scrollTop;
      const scrollHeight = leftBlock.scrollHeight;
      const clientHeight = leftBlock.clientHeight;
      const maxScroll = scrollHeight - clientHeight;
      
      // Если проскроллили дальше максимальной позиции, возвращаем на максимальную
      if (scrollTop > maxScroll) {
        leftBlock.scrollTop = maxScroll;
        return;
      }
      
      const threshold = 300;
      
      if (scrollTop + clientHeight >= scrollHeight - threshold && 
          !loading && 
          hasMore && 
          scrollTop > 0) {
        if (activeRouteButton === 'МАРШРУТЫ') {
          fetchRoutes(currentPage + 1);
        } else if (activeRouteButton === 'ПОДБОРКИ') {
          fetchCollections(currentPage + 1);
        }
      }
    };

    const throttledHandleScroll = _.throttle(handleScroll, 200);

    leftBlock?.addEventListener('scroll', throttledHandleScroll);
    return () => {
      leftBlock?.removeEventListener('scroll', throttledHandleScroll);
      throttledHandleScroll.cancel();
    };
  }, [loading, hasMore, currentPage, fetchRoutes, fetchCollections, activeRouteButton]);

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
    clearAllRoutes?.(); // сброс перед переходом на страницу маршрута
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
                authorImage={r.authorImage} 
                // при клике – переходим на /route/ID
                onOpenRouteDetail={handleOpenRouteDetail}
              />
            ))}
          </div>
        )}

        {activeRouteButton === 'ПОДБОРКИ' && (
          <div className="collection-list">
            {collections.map((c) => (
              <CollectionCard
                key={c.id}
                id={c.id}
                name={c.name}
                description={c.description}
                routes={c.routes}
                onOpenCollectionDetail={handleOpenCollectionDetail}
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
