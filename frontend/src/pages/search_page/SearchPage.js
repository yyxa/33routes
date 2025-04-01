import React, { useEffect, useState, useCallback, useRef } from 'react';
import _ from 'lodash';
import { useSearchParams, useOutletContext } from 'react-router-dom';
import SearchBar from '../../components/search_bar/searchBar';
import RouteCard from '../../components/route_card/routeCard';
import CollectionCard from '../../components/collection_card/collectionCard';
import { COLLECTION_TAGS } from '../../constants/collectionTags';
import './SearchPage.css';

// Вспомогательная функция, ограничивающая число в диапазоне [min, max]
const clamp = (val, min, max) => Math.max(min, Math.min(max, val));

// Компонент двойного ползунка
const ThumbRange = ({ min, max, values, onChange }) => {
  const ref = useRef();
  const getPercent = (val) => ((val - min) / (max - min)) * 100;

  const handleMove = (thumbIndex, clientX) => {
    const rect = ref.current.getBoundingClientRect();
    const percent = ((clientX - rect.left) / rect.width) * 100;
    const raw = min + ((max - min) * percent) / 100;
    const clampedValue = Math.round(clamp(raw, min, max));

    // Не даём левому ползунку пересечься с правым
    if (thumbIndex === 0 && clampedValue >= values[1]) return;
    if (thumbIndex === 1 && clampedValue <= values[0]) return;

    const newValues = [...values];
    newValues[thumbIndex] = clampedValue;
    onChange(newValues);
  };

  const onMouseDown = (index) => (e) => {
    e.preventDefault();
    const move = (ev) => handleMove(index, ev.clientX);
    const up = () => {
      window.removeEventListener('mousemove', move);
      window.removeEventListener('mouseup', up);
    };
    window.addEventListener('mousemove', move);
    window.addEventListener('mouseup', up);
  };

  const onClickTrack = (e) => {
    const rect = ref.current.getBoundingClientRect();
    const clickX = e.clientX - rect.left;
    const percent = clickX / rect.width;
    const value = Math.round(min + percent * (max - min));
    const distMin = Math.abs(value - values[0]);
    const distMax = Math.abs(value - values[1]);

    if (distMin < distMax) {
      onChange([clamp(value, min, values[1] - 1), values[1]]);
    } else {
      onChange([values[0], clamp(value, values[0] + 1, max)]);
    }
  };

  const fillLeft = getPercent(values[0]);
  const fillRight = getPercent(values[1]);

  return (
    <div className="range-container" ref={ref} onClick={onClickTrack}>
      <div className="range-track" />
      <div
        className="range-fill"
        style={{
          left: `${fillLeft}%`,
          width: `${fillRight - fillLeft}%`,
        }}
      />
      <div
        className="range-thumb"
        style={{ left: `${fillLeft}%` }}
        onMouseDown={onMouseDown(0)}
      />
      <div
        className="range-thumb"
        style={{ left: `${fillRight}%` }}
        onMouseDown={onMouseDown(1)}
      />
    </div>
  );
};

const SearchPage = () => {
  const [searchParams, setSearchParams] = useSearchParams();
  const initialQuery = searchParams.get('q') || '';
  const initialType = searchParams.get('type') || 'routes';

  // Запрос пользователя и выбранный тип (routes / collections)
  const [query, setQuery] = useState(initialQuery);
  const [searchType, setSearchType] = useState(initialType);

  // Общий массив результатов (маршруты или подборки)
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(false);

  // Фильтры для МАРШРУТОВ
  const [routeFilters, setRouteFilters] = useState({
    order: 'rating_desc,created_desc,distance', // общая строка со всеми сортировками
    min_length: 0,
    max_length: 100,
    min_duration: 0,
    max_duration: 24,
  });

  // Отдельное управление сортировкой для ПОДБОРОК
  // (две независимые "кнопки": рейтинг (desc/asc) и дата (desc/asc))
  const [collectionFilters, setCollectionFilters] = useState({
    rating: 'rating_desc',   // rating_desc или rating_asc
    created: 'created_desc', // created_desc или created_asc
  });

  // Теги (только для подборок)
  const [selectedTags, setSelectedTags] = useState([]);

  // Флаг и ссылка на DOM для popup
  const [showPopup, setShowPopup] = useState(false);
  const popupRef = useRef(null);

  // Для работы с картой через context
  const { clearAllRoutes } = useOutletContext();

  // Закрываем popup при клике вне него
  useEffect(() => {
    const handleClickOutside = (e) => {
      if (popupRef.current && !popupRef.current.contains(e.target)) {
        setShowPopup(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  // Очищаем все маршруты на карте при первой загрузке
  useEffect(() => {
    clearAllRoutes?.();
  }, [clearAllRoutes]);

  // Смена URL-параметров при изменении типа / запроса
  useEffect(() => {
    const params = { q: query, type: searchType };
    // Если маршруты, добавляем их фильтры в URL (пример)
    if (searchType === 'routes') {
      params.order = routeFilters.order;
      params.min_length = routeFilters.min_length;
      params.max_length = routeFilters.max_length;
      params.min_duration = routeFilters.min_duration;
      params.max_duration = routeFilters.max_duration;
    } 
    // Иначе можно добавлять что-то и для подборок, если нужно
    // (например, params.tags = ...), но тут не обязательно.

    setSearchParams(params);
  }, [query, searchType, routeFilters, setSearchParams]);

  // Для МАРШРУТОВ: получение текущего состояния сортировок (rating_desc/asc и т.д.)
  const getRouteOrderState = () => {
    const parts = routeFilters.order.split(',');
    return {
      rating: parts.includes('rating_asc') ? 'rating_asc' : 'rating_desc',
      created: parts.includes('created_asc') ? 'created_asc' : 'created_desc',
      distance: parts.includes('distance_desc') ? 'distance_desc' : 'distance',
    };
  };

  // Для МАРШРУТОВ: устанавливаем конкретный ключ сортировки
  const setRouteOrderKey = (key, value) => {
    const parts = getRouteOrderState();
    parts[key] = value; // обновили одно поле
    // собираем заново строку вида "rating_desc,created_desc,distance"
    const newOrder = [parts.rating, parts.created, parts.distance].join(',');
    setRouteFilters(f => ({ ...f, order: newOrder }));
  };

  // Тоггл для сортировки ПОДБОРОК (рейтинг / дата)
  const setCollectionRating = (value) => {
    setCollectionFilters(prev => ({ ...prev, rating: value }));
  };
  const setCollectionCreated = (value) => {
    setCollectionFilters(prev => ({ ...prev, created: value }));
  };

  // Функция поиска (debounce)
  const performSearch = useCallback(
    _.debounce(async (q, type, rf, cf, tags) => {
      setLoading(true);
      try {
        // Готовим URL для запроса
        const url = new URL(`http://localhost:8100/api/search/${type}`);
        url.searchParams.set('q', q);

        if (type === 'routes') {
          // Применяем фильтры для маршрутов
          url.searchParams.set('order', rf.order);
          url.searchParams.set('min_length', rf.min_length * 1000);
          url.searchParams.set('max_length', rf.max_length * 1000);
          url.searchParams.set('min_duration', rf.min_duration * 3600);
          url.searchParams.set('max_duration', rf.max_duration * 3600);
        } else {
          // Применяем сортировку для подборок
          // Собираем строку, например "rating_desc,created_desc"
          const orderString = `${cf.rating},${cf.created}`;
          url.searchParams.set('order', orderString);

          // Теги (если выбраны)
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
          // Достаем полные данные по каждому маршруту
          const detailed = await Promise.all(
            ids.map(async (id) => {
              const r = await fetch(`http://localhost:8100/api/route/route/${id}`);
              const d = await r.json();
              const brief = await fetch(`http://localhost:8100/api/user/${d.user.user_id}/brief`).then(rr => rr.json());
              return {
                id: d.route.route_id,
                name: d.route.name,
                description: d.route.description,
                distance: d.route.length,
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
          // Подборки
          const collections = await Promise.all(
            ids.map(async (id) => {
              const r = await fetch(`http://localhost:8100/api/collection/collection/${id}`);
              const d = await r.json();
              return { collection: d.collection, user: d.user };
            })
          );
          setResults(collections);
        }
      } catch (e) {
        console.error(e);
      } finally {
        setLoading(false);
      }
    }, 300),
    []
  );

  // Запуск поиска при каждом изменении нужных состояний
  useEffect(() => {
    clearAllRoutes?.();
    performSearch(
      query,
      searchType,
      routeFilters,
      collectionFilters,
      selectedTags
    );
    return () => performSearch.cancel();
  }, [query, searchType, routeFilters, collectionFilters, selectedTags, performSearch, clearAllRoutes]);

  // Добавление / удаление тегов для подборок
  const toggleTag = (tag) => {
    setSelectedTags(tags =>
      tags.includes(tag) ? tags.filter(t => t !== tag) : [...tags, tag]
    );
  };

  // Текущее состояние сортировок маршрутов
  const routeOrder = getRouteOrderState();
  
  return (
    <div className="search-page">
      <div className="search-controls">
        <SearchBar value={query} onSearch={setQuery} />
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          {/* Переключатель "Маршруты / Подборки" */}
          <div className="toggle-buttons">
            <button
              className={searchType === 'routes' ? 'active' : ''}
              onClick={() => setSearchType('routes')}
            >
              Маршруты
            </button>
            <button
              className={searchType === 'collections' ? 'active' : ''}
              onClick={() => setSearchType('collections')}
            >
              Подборки
            </button>
          </div>

          <div className="popup-buttons">
            <button onClick={() => setShowPopup(!showPopup)}>
              <svg viewBox="0 0 24 24">
                <path d="M10 18h4v-2h-4v2zm-7-5h18v-2H3v2zm3-7v2h12V6H6z"/>
              </svg>
            </button>
          </div>
        </div>

        {/* Попап фильтров / сортировок */}
        {showPopup && (
          <div className="popup filter-popup" ref={popupRef}>
            {searchType === 'routes' ? (
              <>
                {/* ---------------- Фильтры маршрутов ---------------- */}
                <div className="popup-group">
                  <div className="popup-label">Длина маршрута (км)</div>
                  <ThumbRange
                    min={0}
                    max={100}
                    values={[routeFilters.min_length, routeFilters.max_length]}
                    onChange={([min, max]) =>
                      setRouteFilters(f => ({ ...f, min_length: min, max_length: max }))
                    }
                  />
                  <div className="dual-range">
                    <input
                      type="number"
                      value={routeFilters.min_length}
                      onChange={e =>
                        setRouteFilters(f => ({
                          ...f,
                          min_length: clamp(+e.target.value, 0, f.max_length - 1),
                        }))
                      }
                    />
                    <input
                      type="number"
                      value={routeFilters.max_length}
                      onChange={e =>
                        setRouteFilters(f => ({
                          ...f,
                          max_length: clamp(+e.target.value, f.min_length + 1, 100),
                        }))
                      }
                    />
                  </div>
                </div>

                <div className="popup-group">
                  <div className="popup-label">Длительность (часы)</div>
                  <ThumbRange
                    min={0}
                    max={24}
                    values={[routeFilters.min_duration, routeFilters.max_duration]}
                    onChange={([min, max]) =>
                      setRouteFilters(f => ({ ...f, min_duration: min, max_duration: max }))
                    }
                  />
                  <div className="dual-range">
                    <input
                      type="number"
                      value={routeFilters.min_duration}
                      onChange={e =>
                        setRouteFilters(f => ({
                          ...f,
                          min_duration: clamp(+e.target.value, 0, f.max_duration - 1),
                        }))
                      }
                    />
                    <input
                      type="number"
                      value={routeFilters.max_duration}
                      onChange={e =>
                        setRouteFilters(f => ({
                          ...f,
                          max_duration: clamp(+e.target.value, f.min_duration + 1, 24),
                        }))
                      }
                    />
                  </div>
                </div>

                {/* ---------------- Сортировка маршрутов ---------------- */}
                <div className="popup-group">
                  <div className="popup-label">Сортировка</div>
                  <div className="sort-toggle-group">
                    <div className="sort-toggle-row">
                      <div
                        className={`sort-toggle-button ${routeOrder.rating === 'rating_desc' ? 'active' : ''}`}
                        onClick={() => setRouteOrderKey('rating', 'rating_desc')}
                      >
                        рейтинг (убыв.)
                      </div>
                      <div
                        className={`sort-toggle-button ${routeOrder.rating === 'rating_asc' ? 'active' : ''}`}
                        onClick={() => setRouteOrderKey('rating', 'rating_asc')}
                      >
                        рейтинг (возр.)
                      </div>
                    </div>
                    <div className="sort-toggle-row">
                      <div
                        className={`sort-toggle-button ${routeOrder.created === 'created_desc' ? 'active' : ''}`}
                        onClick={() => setRouteOrderKey('created', 'created_desc')}
                      >
                        новые
                      </div>
                      <div
                        className={`sort-toggle-button ${routeOrder.created === 'created_asc' ? 'active' : ''}`}
                        onClick={() => setRouteOrderKey('created', 'created_asc')}
                      >
                        старые
                      </div>
                    </div>
                    <div className="sort-toggle-row">
                      <div
                        className={`sort-toggle-button ${routeOrder.distance === 'distance' ? 'active' : ''}`}
                        onClick={() => setRouteOrderKey('distance', 'distance')}
                      >
                        расстояние (возр.)
                      </div>
                      <div
                        className={`sort-toggle-button ${routeOrder.distance === 'distance_desc' ? 'active' : ''}`}
                        onClick={() => setRouteOrderKey('distance', 'distance_desc')}
                      >
                        расстояние (убыв.)
                      </div>
                    </div>
                  </div>
                </div>
              </>
            ) : (
              <>
                {/* ---------------- Сортировка подборок ---------------- */}
                <div className="popup-group">
                  <div className="popup-label">Сортировка по рейтингу</div>
                  <div className="sort-toggle-row">
                    <div
                      className={`sort-toggle-button ${collectionFilters.rating === 'rating_desc' ? 'active' : ''}`}
                      onClick={() => setCollectionRating('rating_desc')}
                    >
                      рейтинг (убыв.)
                    </div>
                    <div
                      className={`sort-toggle-button ${collectionFilters.rating === 'rating_asc' ? 'active' : ''}`}
                      onClick={() => setCollectionRating('rating_asc')}
                    >
                      рейтинг (возр.)
                    </div>
                  </div>
                </div>
                <div className="popup-group">
                  <div className="popup-label">Сортировка по дате</div>
                  <div className="sort-toggle-row">
                    <div
                      className={`sort-toggle-button ${collectionFilters.created === 'created_desc' ? 'active' : ''}`}
                      onClick={() => setCollectionCreated('created_desc')}
                    >
                      новые
                    </div>
                    <div
                      className={`sort-toggle-button ${collectionFilters.created === 'created_asc' ? 'active' : ''}`}
                      onClick={() => setCollectionCreated('created_asc')}
                    >
                      старые
                    </div>
                  </div>
                </div>

                {/* ---------------- Теги для подборок ---------------- */}
                <div className="popup-group">
                  <div className="popup-label">Теги</div>
                  <select onChange={(e) => toggleTag(e.target.value)} value="">
                    <option value="" disabled>Выбрать тег...</option>
                    {COLLECTION_TAGS.filter(tag => !selectedTags.includes(tag))
                      .map(tag => (
                        <option key={tag} value={tag}>
                          {tag}
                        </option>
                      ))}
                  </select>
                  <div className="tags-selected">
                    {selectedTags.map(tag => (
                      <button
                        key={tag}
                        className="tag"
                        onClick={() => toggleTag(tag)}
                      >
                        {tag} ×
                      </button>
                    ))}
                  </div>
                </div>
              </>
            )}
          </div>
        )}
      </div>

      {/* ---------------- Список результатов ---------------- */}
      {loading && <div className="loading-indicator">Загрузка...</div>}
      {!loading && results.length === 0 && <div className="no-results">Ничего не найдено</div>}

      <div className="results">
        {searchType === 'routes'
          ? results.map((route) => <RouteCard key={route.id} {...route} />)
          : results.map((col, i) => (
              col?.collection
                ? <CollectionCard
                    key={col.collection.collection_id || i}
                    collection={col.collection}
                    user={col.user}
                  />
                : null
            ))
        }
      </div>
    </div>
  );
};

export default SearchPage;
