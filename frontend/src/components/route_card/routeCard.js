import React, { useState, useRef, useEffect } from 'react';
import { Link, useOutletContext, useNavigate, useLocation } from 'react-router-dom';
import './routeCard.css';
import showIcon from './images/show.svg';

const RouteCard = ({
  id,
  name,
  description,
  length,
  duration,
  rating,
  images = [],
  authorImage,
  authorUsername,
  onOpenAuthModal,
  onShowRoute,
  onOpenRouteDetail,
}) => {
  const imagesContainerRef = useRef(null);
  const [scrollOffset, setScrollOffset] = useState(0);
  const [showLeftArrow, setShowLeftArrow] = useState(false);
  const [showRightArrow, setShowRightArrow] = useState(false);
  const [isVisible, setIsVisible] = useState(false);
  const [showFavoritePopup, setShowFavoritePopup] = useState(false);
  const [isSaved, setIsSaved] = useState(false);
  const [isCheckingAuth, setIsCheckingAuth] = useState(false);

  const { toggleRouteOnMap } = useOutletContext();
  const navigate = useNavigate();
  const location = useLocation();

  const IMAGE_WIDTH = 140;
  const GAP = 15;
  const VISIBLE_WIDTH = IMAGE_WIDTH * 2.5;

  const checkAuthAndFetchSaved = async () => {
    try {
      setIsCheckingAuth(true);
      
      // Проверяем авторизацию через /api/user/me
      const authCheck = await fetch('http://localhost:8100/api/user/me', {
        credentials: 'include',
      });

      if (!authCheck.ok) {
        navigate('/auth', { state: { from: location } });
        return false;
      }

      // Проверяем избранное
      const savedRes = await fetch('http://localhost:8100/api/collection/collection/saved', {
        credentials: 'include',
      });

      if (savedRes.ok) {
        const data = await savedRes.json();
        setIsSaved(data.routes?.includes(id) || false);
        return true;
      }
      return false;
    } catch (err) {
      console.error('Ошибка при проверке избранного:', err);
      return false;
    } finally {
      setIsCheckingAuth(false);
    }
  };

  const handleToggleFavorite = async (e) => {
    e.stopPropagation();
    const isAuth = await checkAuthAndFetchSaved();
    if (isAuth) {
      setShowFavoritePopup(true);
    }
  };

  const handleAddToFavorites = async () => {
    try {
      const endpoint = isSaved 
        ? `http://localhost:8100/api/collection/collection/saved/remove/${id}`
        : `http://localhost:8100/api/collection/collection/saved/add/${id}`;
      
      const res = await fetch(endpoint, {
        method: isSaved ? 'DELETE' : 'PUT',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include',
      });
      
      if (res.ok) {
        setIsSaved(!isSaved);
      }
    } catch (err) {
      console.error('Ошибка запроса:', err);
    }
  };

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

  const handleToggleRoute = () => {
    toggleRouteOnMap(id);
    setIsVisible(!isVisible);
  };

  const handleImageClick = (imgUrl) => {
    const imageName = imgUrl.split('/').pop();
    navigate(`/image/${imageName}`, { state: { backgroundLocation: location } });
  };

  const renderImageBlock = () => (
    <div className="route-card-right">
      <div className="route-card-images-wrapper" style={{ width: `${VISIBLE_WIDTH}px`, justifyContent: images.length <= 2 ? 'flex-end' : 'flex-start' }}>
        <div className="route-card-images-container">
          {images.length > 2 && (
            <div className={`left-button-container ${showLeftArrow ? 'arrow-visible' : 'arrow-fade'}`}>
              <button className="arrow-button left" onClick={handleScrollLeft}>&#8249;</button>
            </div>
          )}

          <div className="route-card-images" ref={imagesContainerRef}>
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
  );

  return (
    <div className="route-card">
      <div className="route-card-header">
        <Link to={`/route/${id}`} className="route-name route-name-link">
          {name}
        </Link>
        <Link to={`/user/${authorUsername}`} className="route-author-avatar">
          <img src={authorImage} alt="Автор маршрута" className="author-image" />
        </Link>
      </div>

      <div className="route-card-body">
        <div className="route-card-left">
          <p className="route-description">{description}</p>
        </div>
        {images.length > 0 && renderImageBlock()}
      </div>

      <div className="route-bottom-bar">
        <div className="route-card-info">
          <span>{(length / 1000).toFixed(1)} км</span>
          <span>{(duration > 3600 ? Math.floor(duration / 3600) + ' ч ' + Math.round((duration % 3600) / 60) : Math.round(duration / 60)) + ' мин'}</span>
          <span>{rating}★</span>
        </div>

        <div className="route-interaction-container">
          <button
            className="eye-button"
            style={{
              width: '25px',
              height: '25px',
              borderRadius: '50%',
              backgroundColor: isVisible ? '#ccc' : '#fff',
              border: '1px solid #ccc',
              cursor: 'pointer',
              display: 'flex',
              justifyContent: 'center',
              alignItems: 'center',
            }}
            onClick={handleToggleRoute}
          >
            <img src={showIcon} alt="Показать на карте" style={{ width: '16px', height: '16px' }} />
          </button>

          <div style={{ position: 'relative' }}>
            <button
              className="favorite-button"
              onClick={handleToggleFavorite}
              disabled={isCheckingAuth}
              style={{
                backgroundColor: '#fff',
                border: '1px solid #ccc',
                width: '25px',
                height: '25px',
                borderRadius: '50%',
                cursor: 'pointer',
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                fontSize: '16px',
                fontWeight: 'bold',
                opacity: isCheckingAuth ? 0.7 : 1,
              }}
            >
              {isCheckingAuth ? '...' : '+'}
            </button>

            {showFavoritePopup && (
              <div 
                className="favorite-popup"
                style={{
                  position: 'absolute',
                  bottom: '30px',
                  right: '0',
                  backgroundColor: '#fff',
                  borderRadius: '8px',
                  boxShadow: '0 2px 8px rgba(0,0,0,0.2)',
                  padding: '10px',
                  zIndex: 100,
                  width: '150px',
                }}
              >
                <div 
                  className={`favorite-popup-item ${isSaved ? 'favorite-popup-item-active' : ''}`}
                  onClick={handleAddToFavorites}
                >
                  В избранное
                </div>
                <div className="favorite-popup-note">
                  (подборки появятся позже)
                </div>
              </div>
            )}
          </div>
        </div>
      </div>

      {showFavoritePopup && (
        <div 
          className="favorite-popup-overlay"
          onClick={() => setShowFavoritePopup(false)}
        />
      )}
    </div>
  );
};

export default RouteCard;