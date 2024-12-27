import React from 'react';
import PropTypes from 'prop-types';
import AvatarButton from '../avatar_button/avatarButton'; 
import './collectionCard.css';

const CollectionCard = ({ title, description, routesCount, averageRating, routes, images, authorImage }) => {
  const handleAvatarClick = () => {
    console.log('Avatar button clicked');
  };

  return (
    <div className="collection-card">
      <div className="collection-card-left">
        <h2 className="collection-title">{title}</h2>
        <p className="collection-description">{description}</p>
        
        {/* Проверка, является ли routes массивом перед отрисовкой списка */}
        {Array.isArray(routes) && routes.length > 0 && (
          <ul className="collection-routes">
            {routes.slice(0, 2).map((route, index) => (
              <li key={index} className="collection-route-item">
                <span className="route-index">{index + 1}. </span>
                <span className="route-title">{route.title}</span>
                <span className="route-distance">{route.distance} км</span>
                <span className="route-time">{route.time}</span>
                <span className="route-rating">{route.rating}★</span>
              </li>
            ))}
          </ul>
        )}
      </div>
      <div className="collection-card-right">
        <div className="collection-info">
          <div className="collection-stats">
            <span className="collection-routes-count">Маршрутов: {routesCount}</span>
            <span className="collection-average-rating">Средняя оценка: {averageRating}★</span>
          </div>
          <div className="collection-images">
            {images && images.length > 0 ? (
              images.slice(0, 3).map((img, index) => (
                <img key={index} src={img} alt={`collection-img-${index}`} className="collection-image" />
              ))
            ) : (
              <div className="no-images-placeholder">Нет изображений</div>
            )}
          </div>
        </div>
      </div>
      <div className="collection-card-icons">
        <div className="avatar-button-wrapper">
          <AvatarButton
            imageSrc={authorImage || 'https://via.placeholder.com/40'}
            altText="Автор коллекции"
            onClick={handleAvatarClick}
          />
        </div>
      </div>
    </div>
  );
};

CollectionCard.propTypes = {
  title: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  routesCount: PropTypes.number.isRequired,
  averageRating: PropTypes.number.isRequired,
  routes: PropTypes.arrayOf(
    PropTypes.shape({
      title: PropTypes.string.isRequired,
      distance: PropTypes.number.isRequired,
      time: PropTypes.string.isRequired,
      rating: PropTypes.number.isRequired,
    })
  ).isRequired,
  images: PropTypes.arrayOf(PropTypes.string),
  authorImage: PropTypes.string,
};

CollectionCard.defaultProps = {
  images: [], // По умолчанию пустой массив
  authorImage: '',
};

export default CollectionCard;
