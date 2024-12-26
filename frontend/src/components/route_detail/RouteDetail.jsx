// src/components/route_detail/RouteDetail.jsx

import React from 'react';
import './RouteDetail.css';

const RouteDetail = ({ data, onClose }) => {
  // data: { user, route, points, reviews }
  if (!data) return null;

  const { user, route, points, reviews } = data;
  const userName = user?.name || 'Автор неизвестен';

  return (
    <div className="route-detail">
      {/* Кнопка назад */}
      <button className="back-button" onClick={onClose}>
        ←
      </button>

      <h2>{route?.name}</h2>
      <p>Автор: {userName}</p>
      <p>Описание: {route?.description}</p>
      <p>Дистанция: {Math.round(route?.length / 1000) || 0} км</p>
      <p>Продолжительность: {Math.round(route?.duration / 3600) || 0} ч</p>
      <p>Рейтинг: {route?.rating}★</p>

      {/* Точки маршрута (points) */}
      <h3>Точки:</h3>
      {points.map((pt, idx) => (
        <div key={idx}>
          <p>{pt.point_description}</p>
          {/* Тут можно выводить pt.images и т.д. */}
        </div>
      ))}

      {/* Отзывы */}
      <h3>Отзывы:</h3>
      {reviews.length > 0 ? (
        reviews.map((review) => (
          <div key={review.review_id} className="review-item">
            <p>Пользователь #{review.user_id}</p>
            <p>Рейтинг: {review.rating}</p>
            <p>{review.comment}</p>

            {/* Комментарии к отзыву */}
            <div className="comments-block">
              <strong>Комментарии:</strong>
              {review.comments?.length ? (
                review.comments.map((c) => (
                  <div key={c.id} className="comment-item">
                    <p>
                      {c.text} (от пользователя {c.user_id})
                    </p>
                  </div>
                ))
              ) : (
                <p>Нет комментариев</p>
              )}
            </div>
          </div>
        ))
      ) : (
        <p>Нет отзывов</p>
      )}
    </div>
  );
};

export default RouteDetail;
