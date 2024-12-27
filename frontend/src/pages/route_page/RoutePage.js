import React, { useEffect, useState } from 'react';
import { Helmet } from 'react-helmet-async';
import { useParams } from 'react-router-dom';
import 'ol/ol.css';
import { Map, View } from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import { fromLonLat } from 'ol/proj';

import CommentCard from '../../components/comment_card/commentCard';
import './RoutePage.css';

const RoutePage = () => {
  const { routeId } = useParams(); // Получаем ID маршрута из URL
  const [routeData, setRouteData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    // Получение данных маршрута с сервера
    const fetchRouteData = async () => {
      try {
        const response = await fetch(`https://33routes.ru/api/route/route/${routeId}`, {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          },
        });

        if (!response.ok) {
          throw new Error(`Ошибка API: ${response.status}`);
        }

        const data = await response.json();
        setRouteData(data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchRouteData();
  }, [routeId]);

  useEffect(() => {
    // Инициализация карты OpenLayers
    if (routeData && routeData.route) {
      new Map({
        target: 'map',
        layers: [
          new TileLayer({
            source: new OSM(),
          }),
        ],
        view: new View({
          center: fromLonLat([37.6173, 55.7558]), // Центр Москвы (пока заглушка)
          zoom: 12,
        }),
      });
    }
  }, [routeData]);

  if (loading) return <p>Загрузка...</p>;
  if (error) return <p>Ошибка: {error}</p>;

  const { user, route, points } = routeData;
  const { name, description, length, duration, rating, images } = route;

  return (
    <div className="route-page">
      <Helmet>
        <title>{name}</title>
      </Helmet>

      <div className="route-page-content">
        <div className="route-info-section">
          <div className="route-header">
            <h1>{name}</h1>
            <div className="route-info">
              <span>{length} км</span>
              <span>{Math.ceil(duration / 60)} мин</span>
              <span>{rating.toFixed(1)}★</span>
            </div>
            <p className="route-description">{description}</p>
          </div>

          <div className="route-images">
            <h2>Фотографии</h2>
            <div className="images-list">
              {images && images.length > 0 ? (
                images.map((img, index) => (
                  <img key={index} src={img} alt={`Маршрут ${index}`} className="route-image" />
                ))
              ) : (
                <p>Нет изображений для этого маршрута</p>
              )}
            </div>
          </div>

          <div className="route-points">
            <h2>Точки</h2>
            <div className="points-list">
              {points && points.length > 0 ? (
                points.map((point, index) => (
                  <div key={index} className="point-card">
                    <div className="point-image-wrapper">
                      {point.images && point.images[0] ? (
                        <img
                          src={point.images[0]}
                          alt={`Изображение для ${point.point_description}`}
                          className="point-image"
                        />
                      ) : (
                        <div className="point-placeholder">150 x 150</div>
                      )}
                    </div>
                    <div className="point-name">{point.point_description}</div>
                  </div>
                ))
              ) : (
                <p>Нет точек для этого маршрута</p>
              )}
            </div>
          </div>

          <div className="reviews-section">
            <h2>Отзывы</h2>
            {routeData.reviews && routeData.reviews.length > 0 ? (
              routeData.reviews.map((review, index) => (
                <CommentCard
                  key={index}
                  commentData={{
                    avatar: review.user?.image_url || 'https://via.placeholder.com/40',
                    name: review.user?.name || 'Аноним',
                    comment: review.text,
                    rating: review.rating,
                    replyCount: review.comments.length,
                  }}
                />
              ))
            ) : (
              <p>Нет отзывов для этого маршрута</p>
            )}
          </div>
        </div>

        <div id="map" className="map-container"></div>
      </div>
    </div>
  );
};

export default RoutePage;
