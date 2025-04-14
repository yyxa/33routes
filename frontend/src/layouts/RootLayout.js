// RootLayout.js
import React, { useEffect, useRef, useState, useCallback } from 'react';
import { Outlet } from 'react-router-dom';
import Header from '../components/header/header'; 
import FilterPopup from '../components/filter_popup/filterPopup';
import 'ol/ol.css';
import { Map, View } from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import { fromLonLat } from 'ol/proj';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import Feature from 'ol/Feature';
import Point from 'ol/geom/Point';
import LineString from 'ol/geom/LineString';
import { Style, Stroke, Icon } from 'ol/style';
import './RootLayout.css';
import { useNavigate } from 'react-router-dom';
import { useLocation } from 'react-router-dom';
import { Link } from 'react-router-dom';
import sunIcon from './images/sun.svg';

const RootLayout = ({ user, onLoginClick, onLogoutClick, selectedRoute }) => {
  const mapContainerRef = useRef(null);
  const mapRef = useRef(null);
  const vectorLayerRef = useRef(null);
  const [visibleRoutes, setVisibleRoutes] = useState([]);
  const [isSidebarHidden, setIsSidebarHidden] = useState(false);
  const [showCreatePopup, setShowCreatePopup] = useState(false);
  const navigate = useNavigate();
  const location = useLocation();

  // Ref для левого блока (sidebar)
  const leftBlockRef = useRef(null);

  // Состояния для поискового запроса и типа поиска (маршруты/подборки)
  const [query, setQuery] = useState('');
  const [searchType, setSearchType] = useState('routes');

  const [menuOpen, setMenuOpen] = useState(false);
  const avatarRef = useRef(null);

  useEffect(() => {
    const handleClickOutside = (e) => {
      if (menuOpen && avatarRef.current && !avatarRef.current.contains(e.target)) {
        setMenuOpen(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, [menuOpen]);


  // Состояния для фильтров
  const [routeFilters, setRouteFilters] = useState({
    order: 'rating_desc,created_desc,length_asc',
    min_length: 0,
    max_length: 100,
    min_duration: 0,
    max_duration: 24,
  });
  const [collectionFilters, setCollectionFilters] = useState({
    rating: 'rating_desc',
    created: 'created_desc',
  });
  const [selectedTags, setSelectedTags] = useState([]);
  const [filterBorders, setFilterBorders] = useState(null);

  // Состояние показа попапа фильтров
  const [showPopup, setShowPopup] = useState(false);
  // Ref для попапа (для проверки кликов вне его области)
  const popupRef = useRef(null);

  // Эффект для скрытия попапа при клике вне его
  useEffect(() => {
    const handleClickOutside = (e) => {
      if (showPopup && popupRef.current && !popupRef.current.contains(e.target)) {
        setShowPopup(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, [showPopup]);

  // Получаем границы фильтров с сервера
  useEffect(() => {
    async function fetchBorders() {
      try {
        const res = await fetch('http://localhost:8100/api/search/borders');
        const data = await res.json();
        const newBorders = {
          min_length: data.min_length ? data.min_length / 1000 : 0,
          max_length: data.max_length ? data.max_length / 1000 : 100,
          min_duration: data.min_duration ? data.min_duration / 3600 : 0,
          max_duration: data.max_duration ? data.max_duration / 3600 : 24,
        };
        setFilterBorders(newBorders);
        setRouteFilters(prev => ({ ...prev, ...newBorders }));
      } catch (error) {
        console.error('Error fetching filter borders:', error);
      }
    }
    fetchBorders();
  }, []);

  // Инициализация карты OpenLayers
  useEffect(() => {
    if (!mapRef.current && mapContainerRef.current) {
      const map = new Map({
        target: mapContainerRef.current,
        layers: [new TileLayer({ source: new OSM() })],
        view: new View({
          center: fromLonLat([37.6173, 55.7558]),
          zoom: 12,
        }),
      });
      mapRef.current = map;

      // Создаем оверлей для предпросмотра изображения маршрута
      const overlayDiv = document.createElement('div');
      overlayDiv.id = 'image-overlay';
      Object.assign(overlayDiv.style, {
        position: 'absolute',
        pointerEvents: 'none',
        display: 'none',
        zIndex: 1000,
        border: '2px solid white',
        boxShadow: '0 2px 8px rgba(0,0,0,0.2)',
        borderRadius: '6px',
        overflow: 'hidden',
        width: '150px',
        height: '100px',
      });
      document.body.appendChild(overlayDiv);

      map.on('pointermove', function (evt) {
        const pixel = map.getEventPixel(evt.originalEvent);
        const feature = map.forEachFeatureAtPixel(pixel, f => f);
        if (feature && feature.get('image')) {
          overlayDiv.innerHTML = `<img src="${feature.get('image')}" style="width: 100%; height: 100%; object-fit: cover;" />`;
          const [x, y] = map.getPixelFromCoordinate(feature.getGeometry().getCoordinates());
          overlayDiv.style.left = `${x - 75}px`;
          overlayDiv.style.top = `${y - 120}px`;
          overlayDiv.style.display = 'block';
        } else {
          overlayDiv.style.display = 'none';
        }
      });

      const vectorSrc = new VectorSource();
      const vectorLayer = new VectorLayer({ source: vectorSrc });
      map.addLayer(vectorLayer);
      vectorLayerRef.current = vectorLayer;
    }
  }, []);

  useEffect(() => {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
  }, []);

  const toggleTheme = () => {
    const html = document.documentElement;
    const isDark = html.classList.contains('dark');

    if (isDark) {
      html.classList.remove('dark');
      localStorage.setItem('theme', 'light');
    } else {
      html.classList.add('dark');
      localStorage.setItem('theme', 'dark');
    }
  };

  // Функция для переключения маршрута на карте
  const toggleRouteOnMap = async (routeId) => {
    if (!vectorLayerRef.current) return;
    const vectorSource = vectorLayerRef.current.getSource();

    if (visibleRoutes.includes(routeId)) {
      vectorSource.getFeatures().forEach(feature => {
        if (feature.get('routeId') === routeId) {
          vectorSource.removeFeature(feature);
        }
      });
      setVisibleRoutes(prev => prev.filter(id => id !== routeId));
    } else {
      try {
        const response = await fetch(`http://localhost:8100/api/route/route/${routeId}`);
        const data = await response.json();

        if (!data.points || data.points.length < 2) return;

        const filteredPoints = data.points.filter(p =>
          p.coordinate.latitude > 50 && p.coordinate.latitude < 60 &&
          p.coordinate.longitude > 30 && p.coordinate.longitude < 40
        );
        const sortedPoints = filteredPoints.sort((a, b) => a.time_offset - b.time_offset);
        const coords = sortedPoints.map(p =>
          fromLonLat([p.coordinate.longitude, p.coordinate.latitude])
        );

        // Отрисовка линии маршрута (с тенью и основной линией)
        const routeFeature = new Feature(new LineString(coords));
        routeFeature.setStyle([
          new Style({ stroke: new Stroke({ color: 'rgba(0,0,0,0.4)', width: 6 }) }),
          new Style({ stroke: new Stroke({ color: '#00b956', width: 2 }) }),
        ]);
        routeFeature.set('routeId', routeId);
        vectorSource.addFeature(routeFeature);

        // Отрисовка значка начала маршрута (зелёная точка)
        const startMarker = new Feature(new Point(coords[0]));
        startMarker.setStyle(new Style({
          image: new Icon({
            src: 'https://maps.google.com/mapfiles/ms/icons/green-dot.png',
            scale: 1,
          }),
        }));
        startMarker.set('routeId', routeId);
        vectorSource.addFeature(startMarker);

        // Отрисовка значка конца маршрута (красная точка)
        const endMarker = new Feature(new Point(coords[coords.length - 1]));
        endMarker.setStyle(new Style({
          image: new Icon({
            src: 'https://maps.google.com/mapfiles/ms/icons/red-dot.png',
            scale: 1,
          }),
        }));
        endMarker.set('routeId', routeId);
        vectorSource.addFeature(endMarker);

        // Дополнительные маркеры для точек с изображениями
        data.points
          .filter(p => p.images && p.images.length > 0)
          .forEach(p => {
            const coord = fromLonLat([p.coordinate.longitude, p.coordinate.latitude]);
            const feature = new Feature(new Point(coord));
            feature.setStyle(new Style({
              image: new Icon({
                src: 'https://maps.google.com/mapfiles/ms/icons/blue-dot.png',
                scale: 1,
              }),
            }));
            feature.set('image', `http://localhost:8100/api/media/image/${p.images[0]}`);
            feature.set('routeId', routeId);
            vectorSource.addFeature(feature);
          });

        if (mapRef.current && coords.length > 1) {
          const extent = new LineString(coords).getExtent();
          const paddingLeft = isSidebarHidden
            ? 20
            : leftBlockRef.current
            ? leftBlockRef.current.offsetWidth + 20
            : 20;
          mapRef.current.getView().fit(extent, {
            padding: [50, 50, 50, paddingLeft],
            duration: 600,
            maxZoom: 17,
          });
        }

        setVisibleRoutes(prev => [...prev, routeId]);
      } catch (err) {
        console.error('Ошибка загрузки маршрута:', err);
      }
    }
  };


  const clearAllRoutes = useCallback(() => {
    if (vectorLayerRef.current) vectorLayerRef.current.getSource().clear();
    setVisibleRoutes([]);
  }, []);

  const setVisibleRouteIds = useCallback((ids) => {
    clearAllRoutes();
    ids.forEach(toggleRouteOnMap);
  }, [clearAllRoutes]);

  const menuItemStyle = {
    display: 'block',
    padding: '8px 16px',
    color: '#333',
    textDecoration: 'none',
    fontSize: '14px',
    cursor: 'pointer',
    whiteSpace: 'nowrap',
  };
  
  return (
    // Контейнер с relative для абсолютного позиционирования попапа
    <div className="root-layout" style={{ position: 'relative' }}>
      <div ref={mapContainerRef} className="map-container" />

      {/* Попап фильтров, позиционированный на карте */}
      {showPopup && (
        <FilterPopup
          ref={popupRef}
          style={{
            position: 'absolute',
            top: '80px',
            left: isSidebarHidden
              ? '20px'
              : leftBlockRef.current
              ? `${leftBlockRef.current.offsetWidth + 20}px`
              : 'calc(50vw + 20px)',
            zIndex: 2000,
          }}
          searchType={searchType}
          routeFilters={routeFilters}
          setRouteFilters={setRouteFilters}
          filterBorders={filterBorders}
          collectionFilters={collectionFilters}
          setCollectionFilters={setCollectionFilters}
          selectedTags={selectedTags}
          toggleTag={(tag) =>
            setSelectedTags(tags =>
              tags.includes(tag) ? tags.filter(t => t !== tag) : [...tags, tag]
            )
          }
        />
      )}

      <button
        className="toggle-sidebar-button"
        onClick={() => setIsSidebarHidden(prev => !prev)}
        style={{
          left: isSidebarHidden ? '12px' : 'calc(50vw + 12px)'
        }}
      >
        {isSidebarHidden ? '▶' : '◀'}
      </button>

      <div className="map-header-actions">
        <button className="toggle-theme" onClick={toggleTheme}>
          <img 
            src={sunIcon} 
            alt="theme" 
            style={{ width: '20px', height: '20px' }} 
          />
        </button>
        <div
          ref={avatarRef}
          className="avatar-placeholder"
          style={{
            width: 40,
            height: 40,
            borderRadius: '50%',
            overflow: 'hidden',
            cursor: 'pointer',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
          }}
          onClick={() => {
            if (!user) return onLoginClick();
            setMenuOpen(prev => !prev);
          }}
        >
          {user?.avatar_url ? (
            <img
              src={`http://localhost:8100/api/media/image/${user.avatar_url}`}
              alt="avatar"
              style={{ width: '100%', height: '100%', objectFit: 'cover' }}
            />
          ) : (
            <span style={{ fontSize: 14 }}>{user?.name?.[0] || 'Login'}</span>
          )}
        </div>

        {user && menuOpen && (
          <div
            style={{
              position: 'absolute',
              top: 60,
              right: 0,
              background: 'white',
              border: '1px solid #ccc',
              borderRadius: 10,
              padding: '10px 0',
              zIndex: 3000,
              boxShadow: '0 4px 12px rgba(0,0,0,0.1)',
              minWidth: 160,
            }}
          >
            <Link
              to={`/user/${user.username}`}
              style={menuItemStyle}
              onClick={() => setMenuOpen(false)}
            >
              Моя страница
            </Link>

            <div
              style={menuItemStyle}
              onClick={() => {
                setQuery(`@${user.username}`);
                setSearchType('routes');
                setRouteFilters({
                  order: 'rating_desc,created_desc,length_asc',
                  min_length: filterBorders?.min_length ?? 0,
                  max_length: filterBorders?.max_length ?? 100,
                  min_duration: filterBorders?.min_duration ?? 0,
                  max_duration: filterBorders?.max_duration ?? 24,
                });
                setMenuOpen(false);
                navigate('/');
              }}
            >
              Мои маршруты
            </div>

            <div
              style={menuItemStyle}
              onClick={() => {
                setQuery(`@${user.username}`);
                setSearchType('collections');
                setCollectionFilters({
                  rating: 'rating_desc',
                  created: 'created_desc',
                });
                setSelectedTags([]); // если хочешь сбросить теги
                setMenuOpen(false);
                navigate('/');
              }}
            >
              Мои подборки
            </div>


            <Link to={`/user/${user.username}?tab=reviews`} style={menuItemStyle}>Мои обзоры</Link>
            <Link to={`/user/${user.username}?tab=settings`} style={menuItemStyle}>Настройки</Link>
            <div onClick={onLogoutClick} style={{ ...menuItemStyle, color: 'red' }}>Выйти</div>
          </div>
        )}
      </div>


      <div
        className="left-block"
        ref={leftBlockRef}
        style={{ display: isSidebarHidden ? 'none' : 'flex' }}
      >
        <Header 
          query={query}
          onQueryChange={setQuery}
          type={searchType}
          onTypeChange={setSearchType}
          onFilterToggle={() => setShowPopup(prev => !prev)}
          routeFilters={routeFilters}
          setRouteFilters={setRouteFilters}
          filterBorders={filterBorders}
          collectionFilters={collectionFilters}
          setCollectionFilters={setCollectionFilters}
          selectedTags={selectedTags}
          toggleTag={(tag) =>
            setSelectedTags(tags =>
              tags.includes(tag) ? tags.filter(t => t !== tag) : [...tags, tag]
            )
          }
        />
        <div className="left-scrollable">
          <Outlet context={{
            query,
            searchType,
            clearAllRoutes,
            toggleRouteOnMap,
            routeFilters,
            collectionFilters,
            selectedTags
          }} />
        </div>
      </div>
      <>
      <div
        className="fab-button"
        onClick={() => {
          if (!user) {
            navigate('/auth', { state: { backgroundLocation: location } });
          } else {
            setShowCreatePopup(prev => !prev);
          }
        }}
      >
        ＋
      </div>

      {user && showCreatePopup && (
        <div className="fab-popup">
          <button onClick={() => navigate('/create/route')}>Создать маршрут</button>
          <button onClick={() => navigate('/create/collection')}>Создать подборку</button>
        </div>
      )}
    </>
    </div>
  );
};

export default RootLayout;
