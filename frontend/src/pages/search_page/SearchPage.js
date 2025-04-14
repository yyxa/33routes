// SearchPage.js
import React, { useEffect, useState, useCallback } from 'react';
import _ from 'lodash';
import { useSearchParams, useOutletContext } from 'react-router-dom';
import RouteCard from '../../components/route_card/routeCard';
import CollectionCard from '../../components/collection_card/collectionCard';
import './SearchPage.css';

const SearchPage = () => {
  const {
    query,
    searchType,
    clearAllRoutes,
    routeFilters,
    collectionFilters,
    selectedTags,
  } = useOutletContext();
  const [searchParams, setSearchParams] = useSearchParams();

  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(false);
  const [cols, setCols] = useState([]);

  useEffect(() => {
    const params = { q: query, type: searchType };
    if (searchType === 'routes') {
      params.order = routeFilters.order;
      params.min_length = routeFilters.min_length;
      params.max_length = routeFilters.max_length;
      params.min_duration = routeFilters.min_duration;
      params.max_duration = routeFilters.max_duration;
    }
    setSearchParams(params);
  }, [query, searchType, routeFilters, setSearchParams]);

  const performSearch = useCallback(
    _.debounce(async (q, type, rf, cf, tags) => {
      setLoading(true);
      try {
        const url = new URL(`http://localhost:8100/api/search/${type}`);
        url.searchParams.set('q', q);
        if (type === 'routes') {
          url.searchParams.set('order', rf.order);
          url.searchParams.set('min_length', rf.min_length * 1000);
          url.searchParams.set('max_length', rf.max_length * 1000);
          url.searchParams.set('min_duration', rf.min_duration * 3600);
          url.searchParams.set('max_duration', rf.max_duration * 3600);
        } else {
          const orderString = `${cf.rating},${cf.created}`;
          url.searchParams.set('order', orderString);
          if (tags.length > 0) {
            url.searchParams.set('tags', tags.join(','));
          }
        }
        url.searchParams.set('pagination-page-number', '1');
        url.searchParams.set('pagination-per-page', '1000');

        const res = await fetch(url);
        const data = await res.json();
        const ids = data.results;

        if (type === 'routes') {
          const detailed = await Promise.all(
            ids.map(async (id) => {
              const r = await fetch(`http://localhost:8100/api/route/route/${id}`);
              const d = await r.json();
              const brief = await fetch(`http://localhost:8100/api/user/${d.user.user_id}/brief`)
                .then(rr => rr.json());
              return {
                id: d.route.route_id,
                name: d.route.name,
                description: d.route.description,
                length: d.route.length,
                duration: d.route.duration,
                rating: d.route.rating,
                images: (d.route.images || []).map(i => `http://localhost:8100/api/media/image/${i}`),
                authorImage: d.user.image_url
                  ? `http://localhost:8100/api/media/image/${d.user.image_url}`
                  : `http://localhost:8100/api/media/image/default-avatar.svg`,
                authorUsername: brief.username,
              };
            })
          );
          setResults(detailed);
        } else {
          const collections = await Promise.all(
            ids.map(async (id) => {
              const r = await fetch(`http://localhost:8100/api/collection/collection/${id}`);
              const d = await r.json();
              const brief = await fetch(`http://localhost:8100/api/user/${d.user.user_id}/brief`)
                .then(rr => rr.json());
              return { 
                collection_id: d.collection.collection_id, 
                name: d.collection.name,
                description: d.collection.description,
                rating: d.collection.rating,
                tags: d.collection.tags,
                routes: d.collection.routes,
                images: (d.collection.imgs || []).map(i => `http://localhost:8100/api/media/image/${i}`),
                username: brief.username,
                avatar: d.user.image_url
                  ? `http://localhost:8100/api/media/image/${d.user.image_url}`
                  : `http://localhost:8100/api/media/image/default-avatar.svg`,

              };
            })
          );
          setCols(collections);
        }
      } catch (e) {
        console.error(e);
      } finally {
        setLoading(false);
      }
    }, 300),
    []
  );

  useEffect(() => {
    clearAllRoutes?.();
    performSearch(query, searchType, routeFilters, collectionFilters, selectedTags);
    return () => performSearch.cancel();
  }, [query, searchType, routeFilters, collectionFilters, selectedTags, performSearch, clearAllRoutes]);

  return (
    <div className="search-page">
      {loading && <div className="loading-indicator">Загрузка...</div>}
      {!loading && results.length === 0 && <div className="no-results">Ничего не найдено</div>}
      <div className="results">
        {searchType === 'routes'
          ? results.map((route) => <RouteCard key={route.id} {...route} />)
          : cols.map((col) => <CollectionCard key={col.collection_id} {...col}/>)
        }
      </div>
    </div>
  );
};

export default SearchPage;
