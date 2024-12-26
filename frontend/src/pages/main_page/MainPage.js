// src/pages/main_page/MainPage.js

import React, { useEffect, useRef, useState } from 'react';
import { Helmet } from 'react-helmet-async';
import 'ol/ol.css';
import { Map, View } from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import { fromLonLat } from 'ol/proj';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import Feature from 'ol/Feature';
import Point from 'ol/geom/Point';
import { Style, Icon, Stroke } from 'ol/style';
import { LineString } from 'ol/geom';
import { useNavigate } from 'react-router-dom';

import './MainPage.css';
import SearchBar from "../../components/search_bar/searchBar";
import Button from '../../components/buttons/button';
import RouteCard from '../../components/route_card/routeCard';
import RouteDetail from '../../components/route_detail/RouteDetail'; // <-- ваш детальный блок
import Header from '../../components/header/header';

const MainPage = () => {
  const navigate = useNavigate();
  
  const [activeRouteButton, setActiveRouteButton] = useState('МАРШРУТЫ');
  const [activeSortButton, setActiveSortButton] = useState('');

  const [routes, setRoutes] = useState([]);      // Список всех маршрутов (короткая информация)
  const [selectedRoute, setSelectedRoute] = useState(null); // Один маршрут (полная инфа + отзывы)

  const mapContainerRef = useRef(null);
  const mapRef = useRef(null);
  const routeLayerRef = useRef(null);

  // ------------------------------------------------------
  // ШАГ 1: загрузка списка ID-шников (и короткой инфы) — как раньше
  useEffect(() => {
    const fetchRoutes = async () => {
      try {
        const res = await fetch('http://localhost:8100/api/route/routes');
        const data = await res.json(); // { routes: [1,2,3,...] }
        const routeIds = data.routes || [];

        // Тут вы можете загрузить только минимум (ID, name, description) для карточек
        // Или просто запрашивать все детальные данные для каждого ID. Но чтобы ускорить,
        // пусть это будет краткая инфа.
        const shortPromises = routeIds.map(async (id) => {
          // для примера ещё раз ходим на детальный эндпоинт, но можете завести /routes/short
          // если нужно. Пока оставим как есть.
          const detailRes = await fetch(`http://localhost:8100/api/route/route/${id}`);
          const detailData = await detailRes.json();

          const { route } = detailData;
          return {
            id: route.route_id,
            name: route.name,
            description: route.description,
            distance: `${Math.round(route.length / 1000)} км`,
            duration: `${Math.round(route.duration / 3600)} ч`,
            rating: route.rating || 0,
            images: route.images || [],
          };
        });

        const shortList = await Promise.all(shortPromises);
        setRoutes(shortList);
      } catch (err) {
        console.error('Ошибка при получении маршрутов:', err);
      }
    };

    fetchRoutes();
  }, []);

  // ------------------------------------------------------
  // ИНИЦИАЛИЗАЦИЯ КАРТЫ
  useEffect(() => {
    if (mapContainerRef.current) {
      const map = new Map({
        target: mapContainerRef.current,
        layers: [
          new TileLayer({ source: new OSM() }),
        ],
        view: new View({
          center: fromLonLat([37.6173, 55.7558]),
          zoom: 12,
        }),
      });

      mapRef.current = map;

      const vectorSource = new VectorSource();
      const vectorLayer = new VectorLayer({ source: vectorSource });
      map.addLayer(vectorLayer);
      routeLayerRef.current = vectorSource;

      // Пример: добавим один маркер
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
      vectorSource.addFeature(marker);
    }
  }, []);

  // ------------------------------------------------------
  // ОТРИСОВКА МАРШРУТА НА КАРТЕ
  const handleShowRouteOnMap = (routeDetail) => {
    if (!routeDetail || !routeDetail.points) return;
    if (!mapRef.current || !routeLayerRef.current) return;

    // Очистим предыдущие слои
    routeLayerRef.current.clear();

    // Преобразуем точки
    const coords = routeDetail.points.map((p) =>
      fromLonLat([p.longitude, p.latitude])
    );

    // Создаём Feature
    const routeFeature = new Feature({
      geometry: new LineString(coords),
    });
    routeFeature.setStyle(
      new Style({
        stroke: new Stroke({
          color: 'red',
          width: 3,
        }),
      })
    );
    routeLayerRef.current.addFeature(routeFeature);

    // Автоподгон
    const extent = routeFeature.getGeometry().getExtent();
    mapRef.current.getView().fit(extent, { padding: [50, 50, 50, 50], duration: 1000 });
  };

  // ------------------------------------------------------
  // ШАГ 2: ПОЛУЧЕНИЕ ПОЛНОЙ ИНФОРМАЦИИ ОДНОГО МАРШРУТА + ОТЗЫВЫ + КОММЕНТАРИИ
  const handleOpenRouteDetail = async (routeId) => {
    navigate(`/route/${routeId}`);
  };

  // Закрытие детальной инфы (Назад)
  const handleCloseDetail = () => {
    setSelectedRoute(null);
  };

  // ------------------------------------------------------
  // Сброс при клике вне сортировок
  useEffect(() => {
    const handleDocumentClick = (event) => {
      if (!event.target.closest('.sort-filter-container')) {
        setActiveSortButton('');
      }
    };
    document.addEventListener('click', handleDocumentClick);
    return () => document.removeEventListener('click', handleDocumentClick);
  }, []);

  const handleRouteButtonClick = (buttonType) => {
    setActiveRouteButton((prev) => (prev === buttonType ? '' : buttonType));
    setSelectedRoute(null);
  };

  const handleSortButtonClick = (buttonType) => {
    setActiveSortButton((prev) => (prev === buttonType ? '' : buttonType));
  };

  return (
    <div className="main-container">
      <Helmet>
        <title>33routes - Главная</title>
      </Helmet>
      <Header />

      <div className="divider"></div>

      <div className="content">
        {/* ЛЕВАЯ ПАНЕЛЬ */}
        <div className="left-panel">
          {/* Если маршрут НЕ выбран, показываем список */}
          {!selectedRoute && (
            <>
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
                  routes.map((r) => (
                    <RouteCard
                      key={r.id}
                      id={r.id}
                      name={r.name}
                      description={r.description}
                      distance={r.distance}
                      duration={r.duration}
                      rating={r.rating}
                      images={r.images}
                      // При клике на карточку → загрузить полную инфу, отзывы, комменты
                      onOpenRouteDetail={handleOpenRouteDetail}
                    />
                  ))}
              </div>
            </>
          )}

          {/* Если маршрут выбран, показываем детальную страницу */}
          {selectedRoute && (
            <RouteDetail
              route={selectedRoute}
              onClose={handleCloseDetail}
            />
          )}
        </div>

        {/* ПРАВАЯ ПАНЕЛЬ (Карта) */}
        <div className="right-panel">
          <div
            ref={mapContainerRef}
            className="leaflet-container"
            style={{
              width: '100%',
              height: '100%',
            }}
          />
        </div>
      </div>
    </div>
  );
};

export default MainPage;
