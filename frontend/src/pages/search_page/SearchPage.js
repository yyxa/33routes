import React, { useEffect, useState, useCallback } from 'react';
import { Helmet } from 'react-helmet-async';
import { useNavigate } from 'react-router-dom';
import _ from 'lodash';
import { useOutletContext } from 'react-router-dom';

import SearchBar from '../../components/search_bar/searchBar';
import Button from '../../components/buttons/button';
import RouteCard from '../../components/route_card/routeCard';
import CollectionCard from '../../components/collection_card/collectionCard';

import './SearchPage.css';

const SearchPage = () => {
  const navigate = useNavigate();
  const [activeRouteButton, setActiveRouteButton] = useState('МАРШРУТЫ');
  const [activeSortButton, setActiveSortButton] = useState('');

  const [routes, setRoutes] = useState([]);
  const [collections, setCollections] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);

  const { clearAllRoutes } = useOutletContext();

  const fetchRoutes = useCallback(async (page = 1, perPage = 5) => {
    if (loading) return;
    setLoading(true);

    try {
      const res = await fetch(`http://localhost:8100/api/route/routes?pagination-page-number=${page}&pagination-per-page=${perPage}`);
      if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
      const data = await res.json();

      const currentPage = parseInt(res.headers.get('pagination-current-page')) || 1;
      const totalPages = parseInt(res.headers.get('pagination-total-pages')) || 1;

      const routePromises = data.routes.map(async (id) => {
        const detailRes = await fetch(`http://localhost:8100/api/route/route/${id}`);
        const detailData = await detailRes.json();

        const route = detailData.route;
        const user = detailData.user;

        const briefRes = await fetch(`http://localhost:8100/api/user/${user.user_id}/brief`);
        const brief = await briefRes.json();

        return {
          id: route.route_id,
          name: route.name,
          description: route.description,
          distance: route.length,
          duration: route.duration,
          rating: route.rating,
          images: (route.images || []).map(name => `http://localhost:8100/api/media/image/${name}`),
          authorImage: user.image_url
            ? `http://localhost:8100/api/media/image/${user.image_url}`
            : 'http://localhost:8100/api/media/image/default-avatar.svg',
          authorUsername: brief.username,
        };
      });

      const newRoutes = await Promise.all(routePromises);

      setRoutes(prev => [
        ...prev,
        ...newRoutes.filter(r => !prev.some(existing => existing.id === r.id)),
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

  const fetchCollections = async () => {
    try {
      const res = await fetch(`http://localhost:8100/api/collection/collections?pagination-page-number=1&pagination-per-page=5`);
      const ids = (await res.json()).collections;

      const fullCollections = await Promise.all(
        ids.map(async id => {
          const r = await fetch(`http://localhost:8100/api/collection/collection/${id}`);
          const data = await r.json();
          return { ...data.collection, user: data.user };
        })
      );

      setCollections(fullCollections);
    } catch (err) {
      console.error('Ошибка загрузки коллекций:', err);
    }
  };

  useEffect(() => {
    clearAllRoutes?.();
    if (activeRouteButton === 'МАРШРУТЫ') {
      setRoutes([]);
      setCurrentPage(1);
      fetchRoutes(1);
    } else {
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

      if (scrollTop > maxScroll) {
        leftBlock.scrollTop = maxScroll;
        return;
      }

      const threshold = 300;

      if (scrollTop + clientHeight >= scrollHeight - threshold &&
          !loading && hasMore && scrollTop > 0) {
        if (activeRouteButton === 'МАРШРУТЫ') {
          fetchRoutes(currentPage + 1);
        } else {
          fetchCollections(currentPage + 1);
        }
      }
    };

    const throttledScroll = _.throttle(handleScroll, 200);

    leftBlock?.addEventListener('scroll', throttledScroll);
    return () => {
      leftBlock?.removeEventListener('scroll', throttledScroll);
      throttledScroll.cancel();
    };
  }, [loading, hasMore, currentPage, fetchRoutes, fetchCollections, activeRouteButton]);

  useEffect(() => {
    const handleDocumentClick = (event) => {
      if (!event.target.closest('.sort-filter-container')) {
        setActiveSortButton('');
      }
    };
    document.addEventListener('click', handleDocumentClick);
    return () => document.removeEventListener('click', handleDocumentClick);
  }, []);

  const handleRouteButtonClick = (type) => setActiveRouteButton(type);
  const handleSortButtonClick = (type) => setActiveSortButton(prev => prev === type ? '' : type);
  const handleOpenRouteDetail = (id) => {
    clearAllRoutes?.();
    navigate(`/route/${id}`);
  };
  const handleOpenCollectionDetail = (id) => navigate(`/collection/${id}`);

  return (
    <div className="search-page">
      <Helmet><title>33routes - Поиск</title></Helmet>
      <SearchBar />

      <div className="button-groups">
        <div className="type-button-container">
          <Button label="МАРШРУТЫ" variant={activeRouteButton === 'МАРШРУТЫ' ? 'dark' : 'white'} onClick={() => handleRouteButtonClick('МАРШРУТЫ')} />
          <Button label="ПОДБОРКИ" variant={activeRouteButton === 'ПОДБОРКИ' ? 'dark' : 'white'} onClick={() => handleRouteButtonClick('ПОДБОРКИ')} />
        </div>
        <div className="sort-filter-container">
          <Button label="СОРТИРОВАТЬ" variant={activeSortButton === 'СОРТИРОВАТЬ' ? 'dark' : 'white'} onClick={() => handleSortButtonClick('СОРТИРОВАТЬ')} />
          <Button label="ФИЛЬТРЫ" variant={activeSortButton === 'ФИЛЬТРЫ' ? 'dark' : 'white'} onClick={() => handleSortButtonClick('ФИЛЬТРЫ')} />
        </div>
      </div>

      <div className="list-content">
        {activeRouteButton === 'МАРШРУТЫ' && (
          <div className="route-list">
            {routes.map((r) => (
              <RouteCard
                key={r.id}
                {...r}
                onOpenRouteDetail={handleOpenRouteDetail}
              />
            ))}
          </div>
        )}
        {activeRouteButton === 'ПОДБОРКИ' && (
          <div className="collection-list">
            {collections.map(c => (
              <CollectionCard key={c.collection_id} collection={c} onClick={() => handleOpenCollectionDetail(c.collection_id)} />
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
