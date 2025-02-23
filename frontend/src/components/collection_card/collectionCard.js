import React from 'react';
import PropTypes from 'prop-types';
import './collectionCard.css';

const CollectionCard = ({ 
  id,
  name, 
  description,
  routes = [], // массив маршрутов с информацией о каждом
  onOpenCollectionDetail 
}) => {
  const firstRoute = routes[0];
  const secondRoute = routes[1];

  const formatDuration = (seconds) => {
    if (!seconds) return '0 мин';
    const minutes = Math.floor(seconds / 60);
    return `${minutes} мин`;
  };

  return (
    <div className="collection-card" onClick={() => onOpenCollectionDetail(id)}>
      <div className="collection-header">
        <div className="coll-name">{name}</div>
        <div className="collection-author">{"name"}</div>
      </div>
      <div className="collection-content-left">
        <div className="collection-description">{description}</div>
        {firstRoute && (
          <>
            <div className="coll-route-name">1. {firstRoute.name}</div>
            <div className="collection-route-1">
              <span className="route-length">{firstRoute.length} км</span>
              <span className="route-time">{formatDuration(firstRoute.duration)}</span>
              <span className="route-rate">{firstRoute.rating}★</span>
            </div>
          </>
        )}
        {secondRoute && (
          <>
            <div className="coll-route-name">2. {secondRoute.name}</div>
            <div className="collection-route-2">
              <span className="route-length">{secondRoute.length} км</span>
              <span className="route-time">{formatDuration(secondRoute.duration)}</span>
              <span className="route-rate">{secondRoute.rating}★</span>
            </div>
          </>
        )}
      </div>
    </div>
  );
};

CollectionCard.propTypes = {
  id: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  routes: PropTypes.arrayOf(PropTypes.shape({
    name: PropTypes.string, 
    length: PropTypes.number,
    duration: PropTypes.number,
    rating: PropTypes.number
  })),
  onOpenCollectionDetail: PropTypes.func.isRequired
};

export default CollectionCard;
