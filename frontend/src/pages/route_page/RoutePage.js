// src/pages/route_page/RoutePage.js

import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Helmet } from 'react-helmet-async';
import Header from '../../components/header/header';
import RouteDetail from '../../components/route_detail/RouteDetail'; 
// <-- ваш компонент, который красиво отображает маршрут, отзывы, комментарии

const RoutePage = () => {
  const { id } = useParams();
  const navigate = useNavigate();

  const [routeData, setRouteData] = useState(null);

  useEffect(() => {
    const fetchRouteData = async () => {
      try {
        // 1. Маршрут
        const detailRes = await fetch(`http://localhost:8100/api/route/route/${id}`);
        const detailJson = await detailRes.json();
        // 2. Отзывы
        const reviewsRes = await fetch(`http://localhost:8100/api/review/route/${id}/reviews`);
        const reviewsJson = await reviewsRes.json();

        // 3. Подтянем комментарии для каждого отзыва
        const reviewsWithComments = await Promise.all(
          (reviewsJson.reviews || []).map(async (rev) => {
            const commRes = await fetch(`http://localhost:8100/api/comment/review/${rev.review_id}/comments`);
            const commJson = await commRes.json();
            return {
              ...rev,
              comments: commJson.comments || [],
            };
          })
        );

        // Соберём всё
        setRouteData({
          user: detailJson.user || null,         // инфа об авторе
          route: detailJson.route || null,       // основные поля маршрута
          points: detailJson.points || [],       // массив точек
          reviews: reviewsWithComments,
        });

      } catch (err) {
        console.error('Ошибка загрузки полного маршрута', err);
      }
    };

    fetchRouteData();
  }, [id]);

  // Функция "Назад"
  const handleGoBack = () => {
    navigate(-1); // или window.history.back()
  };

  return (
    <div>
      <Helmet>
        <title>Маршрут #{id}</title>
      </Helmet>
      <Header />

      {routeData ? (
        <RouteDetail
          data={routeData}
          onClose={handleGoBack} // передаём колбэк кнопке «Назад»
        />
      ) : (
        <p>Загрузка...</p>
      )}
    </div>
  );
};

export default RoutePage;
