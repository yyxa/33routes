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

const RootLayout = ({ user, onLoginClick, onLogoutClick, selectedRoute }) => {
  const mapContainerRef = useRef(null);
  const mapRef = useRef(null);
  const vectorLayerRef = useRef(null);
  const [visibleRoutes, setVisibleRoutes] = useState([]);
  const [isSidebarHidden, setIsSidebarHidden] = useState(false);

  // Ref для левого блока (sidebar)
  const leftBlockRef = useRef(null);

  // Состояния для поискового запроса и типа поиска (маршруты/подборки)
  const [query, setQuery] = useState('');
  const [searchType, setSearchType] = useState('routes');

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
        <div className="avatar-placeholder" onClick={() => !user && onLoginClick()}>
          <span>{user ? user.name : 'Login'}</span>
        </div>
        <button className="menu-button" onClick={() => console.log("Menu clicked")}>...</button>
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
    </div>
  );
};

export default RootLayout;
