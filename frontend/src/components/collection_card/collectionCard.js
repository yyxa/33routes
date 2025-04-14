import React, { useState, useRef, useEffect } from 'react';
import { Link, useOutletContext, useNavigate, useLocation } from 'react-router-dom';
import './collectionCard.css';

const formatLength = (m) => `${(m / 1000).toFixed(0)} км`;
const formatDuration = (s) => {
  const h = Math.floor(s / 3600);
  const m = Math.floor((s % 3600) / 60);
  return `${h > 0 ? h + ' час' + (h > 1 ? 'а' : '') : ''} ${m > 0 ? m + ' минут' : ''}`.trim();
};

const CollectionCard = ({     
  collection_id,
  name,
  description,
  rating,
  tags,
  routes,
  images = [],
  username,
  avatar,
}) => {
  const [routePreviews, setRoutePreviews] = useState([]);

  const IMAGE_WIDTH = 140;
  const GAP = 15;
  const VISIBLE_WIDTH = IMAGE_WIDTH * 2.5;
  
  const imagesContainerRef = useRef(null);
  const [scrollOffset, setScrollOffset] = useState(0);
  const [showLeftArrow, setShowLeftArrow] = useState(false);
  const [showRightArrow, setShowRightArrow] = useState(false);

  const navigate = useNavigate();
  const location = useLocation();

  useEffect(() => {
    const routeIds = routes.ids;

    if (!Array.isArray(routeIds)) {
      console.warn("Некорректная структура routes:", routes);
      return;
    }

    const fetchRoutes = async () => {
      try {
        const previews = await Promise.all(
          routeIds.slice(0, 2).map(async (id) => {
            const res = await fetch(`http://localhost:8100/api/route/route/${id}`);
            const data = await res.json();
            return data.route;
          })
        );
        setRoutePreviews(previews);
      } catch (error) {
        console.error("Ошибка загрузки маршрутов:", error);
      }
    };

    fetchRoutes();
  }, [routes]);

  const updateGradient = (offset) => {
    const maxOffset = Math.max(0, images.length * (IMAGE_WIDTH + GAP) - GAP - VISIBLE_WIDTH);
    const wrapper = imagesContainerRef.current?.parentElement;
    if (!wrapper) return;

    let mask = '';

    if (offset > 0 && offset < maxOffset) {
      mask = 'linear-gradient(to right, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 10%, rgba(255,255,255,1) 90%, rgba(255,255,255,0) 100%)';
    } else if (offset === 0 && offset < maxOffset) {
      mask = 'linear-gradient(to right, rgba(255,255,255,1) 0%, rgba(255,255,255,1) 90%, rgba(255,255,255,0) 100%)';
    } else if (offset > 0 && offset === maxOffset) {
      mask = 'linear-gradient(to right, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 10%, rgba(255,255,255,1) 100%)';
    } else {
      mask = 'none';
    }

    wrapper.style.maskImage = mask;
    wrapper.style.webkitMaskImage = mask;
    wrapper.style.maskSize = '100% 100%';
    wrapper.style.maskRepeat = 'no-repeat';
    wrapper.style.transition = 'mask-image 0.5s ease';
  };

  useEffect(() => {
    const maxOffset = Math.max(0, images.length * (IMAGE_WIDTH + GAP) - GAP - VISIBLE_WIDTH);
    setShowLeftArrow(scrollOffset > 0);
    setShowRightArrow(scrollOffset < maxOffset);
    updateGradient(scrollOffset);
  }, [scrollOffset, images]);

  useEffect(() => {
    if (imagesContainerRef.current) {
      imagesContainerRef.current.style.transform = `translateX(-${scrollOffset}px)`;
    }
  }, [scrollOffset]);

  const handleScrollLeft = () => {
    setScrollOffset(Math.max(scrollOffset - (IMAGE_WIDTH + GAP), 0));
  };

  const handleScrollRight = () => {
    const maxOffset = Math.max(0, images.length * (IMAGE_WIDTH + GAP) - GAP - VISIBLE_WIDTH);
    setScrollOffset(Math.min(scrollOffset + (IMAGE_WIDTH + GAP), maxOffset));
  };

  const handleImageClick = (imgUrl) => {
    const imageName = imgUrl.split('/').pop();
    navigate(`/image/${imageName}`, { state: { backgroundLocation: location } });
  };


  return (
    <div className="collection-card">
      <div className="collection-card-header">
        <Link to={`/collection/${collection_id}`} className="collection-name collection-name-link">
          {name}
        </Link>
        <Link to={`user/${username}`} className="collection-author-avatar">
          <img
            src={avatar}
            alt="Автор"
            className="author-image"
          />
        </Link>
      </div>

      <div className="collection-card-body">
        <div className="collection-card-left">
          <p className="collection-description">{description}</p>
          <div className="collection-routes-preview">
            {routePreviews.map((route, index) => (
              <div className="collection-route-line" key={route.route_id}>
                <div className="collection-route-name">
                  <strong>{index + 1}.</strong> {route.name}
                </div>
                <div className="collection-route-meta">
                  <span>{formatLength(route.length)}</span>
                  <span>{formatDuration(route.duration)}</span>
                  <span className="rating">{route.rating.toFixed(1)}★</span>
                </div>
              </div>
            ))}
          </div>
        </div>
        <div className="collection-card-right">
          <div className="collection-card-images-wrapper" style={{ width: `${VISIBLE_WIDTH}px`, justifyContent: images.length <= 2 ? 'flex-end' : 'flex-start' }}>
            <div className="collection-card-images-container">
              {images.length > 2 && (
                <div className={`left-button-container ${showLeftArrow ? 'arrow-visible' : 'arrow-fade'}`}>
                  <button className="arrow-button left" onClick={handleScrollLeft}>&#8249;</button>
                </div>
              )}

              <div className="collection-card-images" ref={imagesContainerRef}>
                {images.length > 0 ? (
                  images.map((img, index) => (
                    <img key={index} src={img} alt={`route-img-${index}`} className="route-image" onClick={() => handleImageClick(img)} />
                  ))
                ) : (
                  <div className="no-image-placeholder">Нет изображений</div>
                )}
              </div>

              {images.length > 2 && (
                <div className={`right-button-container ${showRightArrow ? 'arrow-visible' : 'arrow-fade'}`}>
                  <button className="arrow-button right" onClick={handleScrollRight}>&#8250;</button>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>

      {tags?.length > 0 && (
        <div className="collection-tags">
          {tags.map(tag => (
            <span key={tag} className="tag">#{tag}</span>
          ))}
        </div>
      )}
    </div>
  );
};

export default CollectionCard;
