// src/components/route_card/routeCard.js

import React, { useState, useRef } from 'react';
import { useOutletContext } from 'react-router-dom';
import './routeCard.css';
import showIcon from './images/show.svg';

const RouteCard = ({
  id,
  name,
  description,
  distance,
  duration,
  rating,
  images = [],
  authorImage,

  user,                // <-- добавлено: текущий пользователь (null, если не авторизован)
  onOpenAuthModal,     // <-- добавлено: открыть окно авторизации
  onShowRoute,
  onOpenRouteDetail,
}) => {
  const [scrollOffset, setScrollOffset] = useState(0);
  const imagesContainerRef = useRef(null);
  const [isVisible, setIsVisible] = useState(false); // ✅ Состояние кнопки глазика
  const { toggleRouteOnMap } = useOutletContext();
  const [isSaved, setIsSaved] = useState(false);

  const handleToggleRoute = () => {
    toggleRouteOnMap(id);  // Вызываем функцию отображения / скрытия маршрута
    setIsVisible(!isVisible);
  };

  const handleScrollLeft = () => {
    if (imagesContainerRef.current) {
      const newOffset = Math.max(scrollOffset - 140, 0);
      setScrollOffset(newOffset);
      imagesContainerRef.current.style.transform = `translateX(-${newOffset}px)`;
    }
  };

  const handleScrollRight = () => {
    if (imagesContainerRef.current) {
      const newOffset = Math.min(
        scrollOffset + 140,
        images.length * 140 - imagesContainerRef.current.clientWidth
      );
      setScrollOffset(newOffset);
      imagesContainerRef.current.style.transform = `translateX(-${newOffset}px)`;
    }
  };

  // Клик по карточке (кроме кнопок)
  const handleCardClick = (e) => {
    if (e.target.closest('.eye-button') || e.target.closest('.favorite-button')) {
      // Клик был по кнопкам – не переходим
      return;
    }
    // Иначе открываем детальную инфу
    if (onOpenRouteDetail) {
      onOpenRouteDetail(id);
    }
  };

  const handleToggleFavorite = async (e) => {
    e.stopPropagation(); // чтобы не сработал переход по карточке
  
    try {
      const res = await fetch('http://localhost:8100/api/route/save', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        credentials: 'include', // ✅ важно: чтобы кука ушла на бэкенд
        body: JSON.stringify({ route_id: id }),
      });
  
      if (res.ok) {
        setIsSaved(true);
      } else if (res.status === 409) {
        console.warn('Уже сохранено');
        setIsSaved(true);
      } else {
        console.error('Не удалось сохранить маршрут');
      }
    } catch (err) {
      console.error('Ошибка запроса:', err);
    }
  };  

  return (
    <div className="route-card" onClick={handleCardClick}>
      <div className="route-card-header">
        <h3 className="route-name">{name}</h3>
        <div className="route-author-avatar">
          <img src={authorImage} alt="Автор маршрута" className="author-image" />
        </div>
      </div>

      <div className="route-card-body">
        <div className="route-card-left">
          <p className="route-description">{description}</p>
          <div className="route-card-info">
            <span className="route-distance">
              {(distance / 1000).toFixed(1)} км
            </span>
            <span className="route-duration">{
              (duration > 3600 ? (
                (duration / 3600).toFixed(0)
              ) : (
                (duration / 60).toFixed(0)
              )
            )} {duration > 3600 ? 'ч' : 'мин'}  {
              (duration > 3600 && (
                (duration % 3600 / 60).toFixed(0)
              )
            )} {duration > 3600 && 'мин'}
            </span>
          <span className="route-rating">{rating}★</span>
          </div>
        </div>

        <div className="route-card-right">
          <div className="route-card-images-container">
            <div className="left-button-container">
              <button className="arrow-button left" onClick={handleScrollLeft}>
                &#8249;
              </button>
            </div>

            <div className="route-card-images" ref={imagesContainerRef}>
              {images.length > 0 ? (
                images.map((img, index) => (
                  <img key={index} src={img} alt={`route-img-${index}`} className="route-image" />
                ))
              ) : (
                <div className="no-image-placeholder">Нет изображений</div>
              )}
            </div>

            <div className="right-button-container">
              <button className="arrow-button right" onClick={handleScrollRight}>
                &#8250;
              </button>
            </div>
          </div>
          <div className="route-interaction-container">
            <button
              className={`eye-button ${isVisible ? 'active' : ''}`} // Меняем цвет кнопки
              style={{
                width: '25px',
                height: '25px',
                borderRadius: '50%',
                position: 'relative',
                bottom: '0px',
                right: '0px',
                backgroundColor: isVisible ? '#ccc' : '#fff', // Серый, если маршрут включен
                border: '1px solid #ccc',
                cursor: 'pointer',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
              }}
              onClick={handleToggleRoute}
              > <img src={showIcon} alt="Показать на карте" style={{ width: '16px', height: '16px' }} />
            </button>

            <button
              className="favorite-button"
              onClick={handleToggleFavorite}
              style={{
                backgroundColor: isSaved ? '#ffe066' : '#fff',
                borderColor: isSaved ? '#ffa500' : '#ccc',
                color: isSaved ? '#d2691e' : '#333'
              }}
            >★</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default RouteCard;
