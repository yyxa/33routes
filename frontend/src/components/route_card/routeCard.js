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
}) => {
  const imagesContainerRef = useRef(null);
  const [scrollOffset, setScrollOffset] = useState(0);
  const [showLeftArrow, setShowLeftArrow] = useState(false);
  const [showRightArrow, setShowRightArrow] = useState(false);
  const [isVisible, setIsVisible] = useState(false);
  const [showPopup, setShowPopup] = useState(false);
  const [isSaved, setIsSaved] = useState(false);
  const [collections, setCollections] = useState([]);
  const [collectionIds, setCollectionIds] = useState([]);
  const [isChecking, setIsChecking] = useState(false);

  const { toggleRouteOnMap } = useOutletContext();
  const navigate = useNavigate();
  const location = useLocation();

  const IMAGE_WIDTH = 140;
  const GAP = 15;
  const VISIBLE_WIDTH = IMAGE_WIDTH * 2.5;

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

  const handleToggleFavorite = async (e) => {
    e.stopPropagation();
    setIsChecking(true);
    try {
      const authRes = await fetch('http://localhost:8100/api/user/me', {
        credentials: 'include',
      });
  
      if (!authRes.ok) return navigate('/auth');
  
      const userData = await authRes.json();
      const username = userData.username;
  
      const savedRes = await fetch('http://localhost:8100/api/collection/collection/saved', {
        credentials: 'include',
      });
  
      const savedData = await savedRes.json();
      setIsSaved(savedData.routes?.includes(id));
  
      const fetchUserCollections = async (username) => {
        const res = await fetch(`http://localhost:8100/api/search/collections?q=%40${username}&pagination-page-number=1&pagination-per-page=100`);
        const data = await res.json();
        return data.results || [];
      };
  
      const collectionIdsRaw = await fetchUserCollections(username);
  
      const fullData = await Promise.all(collectionIdsRaw.map(async (cid) => {
        const r = await fetch(`http://localhost:8100/api/collection/collection/${cid}`);
        const d = await r.json();
        return {
          collection_id: d.collection.collection_id,
          name: d.collection.name,
          routes: Array.isArray(d.collection.routes?.ids) ? d.collection.routes.ids : [],
        };
      }));
  
      const idsContainingThisRoute = fullData
        .filter(c => c.routes.includes(id))
        .map(c => c.collection_id);
  
      setCollections(fullData);
      setCollectionIds(idsContainingThisRoute);
  
      setTimeout(() => {
        setShowPopup(true);
      }, 0);
    } catch (err) {
      console.error('Ошибка при получении подборок:', err);
    } finally {
      setIsChecking(false);
    }
  };  

  const addToCollection = async (collectionId) => {
    await fetch(`http://localhost:8100/api/collection/collection/${collectionId}/add/${id}`, {
      method: 'PUT',
      credentials: 'include',
    });
  };

  const removeFromCollection = async (collectionId) => {
    await fetch(`http://localhost:8100/api/collection/collection/${collectionId}/remove/${id}`, {
      method: 'DELETE',
      credentials: 'include',
    });
  };

  const handleCollectionClick = async (colId) => {
    if (collectionIds.includes(colId)) {
      await removeFromCollection(colId);
      setCollectionIds(prev => prev.filter(id => id !== colId));
    } else {
      await addToCollection(colId);
      setCollectionIds(prev => [...prev, colId]);
    }
  };

  const handleAddToFavorites = async () => {
    const endpoint = isSaved
      ? `http://localhost:8100/api/collection/collection/saved/remove/${id}`
      : `http://localhost:8100/api/collection/collection/saved/add/${id}`;
    const method = isSaved ? 'DELETE' : 'PUT';
    await fetch(endpoint, { method, credentials: 'include' });
    setIsSaved(!isSaved);
  };

  const handleImageClick = (imgUrl) => {
    const imageName = imgUrl.split('/').pop();
    navigate(`/image/${imageName}`, { state: { backgroundLocation: location } });
  };

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
        {images.length > 0 && (
          <div className="route-card-right">
            <div className="route-card-images-wrapper" style={{ width: `${VISIBLE_WIDTH}px` }}>
              <div className="route-card-images-container">
                {images.length > 2 && (
                  <div className={`left-button-container ${showLeftArrow ? 'arrow-visible' : ''}`}>
                    <button className="arrow-button left" onClick={handleScrollLeft}>&#8249;</button>
                  </div>
                )}

                <div className="route-card-images" ref={imagesContainerRef}>
                  {images.map((img, i) => (
                    <img
                      key={i}
                      src={img}
                      alt={`route-${i}`}
                      className="route-image"
                      onClick={() => handleImageClick(img)}
                    />
                  ))}
                </div>

                {images.length > 2 && (
                  <div className={`right-button-container ${showRightArrow ? 'arrow-visible' : ''}`}>
                    <button className="arrow-button right" onClick={handleScrollRight}>&#8250;</button>
                  </div>
                )}
              </div>
            </div>
          </div>
        )}
      </div>

      <div className="route-bottom-bar">
        <div className="route-card-info">
          <span>{(length / 1000).toFixed(1)} км</span>
          <span>{Math.round(duration / 60)} мин</span>
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
              disabled={isChecking}
            >
              {isChecking ? '...' : '+'}
            </button>

            {showPopup && (
              <>
                <div className="favorite-popup">
                  <div
                    className={`favorite-popup-item ${isSaved ? 'favorite-popup-item-active' : ''}`}
                    onClick={handleAddToFavorites}
                  >
                    В избранное
                  </div>
                  {collections.length > 0 ? (
                    collections.map((col) => (
                      <div
                        key={col.collection_id}
                        className={`favorite-popup-item ${collectionIds.includes(col.collection_id) ? 'favorite-popup-item-active' : ''}`}
                        onClick={() => handleCollectionClick(col.collection_id)}
                      >
                        {col.name}
                      </div>
                    ))
                  ) : (
                    <div className="favorite-popup-note">Подборок нет</div>
                  )}
                </div>
                <div className="favorite-popup-overlay" onClick={() => setShowPopup(false)} />
              </>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default RouteCard;
