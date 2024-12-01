import React, { useState, useRef } from 'react';
import './routeCard.css';

const RouteCard = ({ name, description, distance, duration, rating, images, authorImage }) => {
  const [scrollOffset, setScrollOffset] = useState(0);
  const imagesContainerRef = useRef(null);

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

  return (
    <div className="route-card">
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
            <span className="route-distance">{distance}</span>
            <span className="route-duration">{duration}</span>
            <span className="route-rating">{rating}★</span>
          </div>
        </div>

        <div className="route-card-right">
          <div className="route-card-images-container">
            <button className="arrow-button left" onClick={handleScrollLeft}>
              &#8249;
            </button>
            <div className="route-card-images" ref={imagesContainerRef}>
              {images.length > 0 ? (
                images.map((img, index) => (
                  <img key={index} src={img} alt={`route-img-${index}`} className="route-image" />
                ))
              ) : (
                <div className="no-image-placeholder">Нет изображений</div>
              )}
            </div>
            <button className="arrow-button right" onClick={handleScrollRight}>
              &#8250;
            </button>
          </div>
        </div>

        <button className="favorite-button">★</button>
      </div>
    </div>
  );
};

export default RouteCard;
