import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import SearchBar from '../../components/search_bar/searchBar';
import CommentCard from '../../components/comment_card/commentCard';
import './RoutePage.css';

const formatDuration = (minutes) => {
  const mins = Math.round(minutes);
  if (mins < 60) return `${mins} мин`;
  const h = Math.floor(mins / 60);
  const m = mins % 60;
  return `${h} ч${m > 0 ? ` ${m} мин` : ''}`;
};

const getPluralForm = (n) => {
  if (n % 10 === 1 && n % 100 !== 11) return '';
  if ([2, 3, 4].includes(n % 10) && ![12, 13, 14].includes(n % 100)) return 'а';
  return 'ов';
};

const RoutePage = () => {
  const { routeId } = useParams();
  const [routeData, setRouteData] = useState(null);
  const [reviewCount, setReviewCount] = useState(null);

  const fetchReviews = async () => {
    try {
      const response = await fetch(`http://localhost:8100/api/review/route/${routeId}/reviews`);
      const data = await response.json();
  
      const reviews = data?.reviews || [];
      setReviewCount(reviews.length);
    } catch (error) {
      console.error('Ошибка загрузки отзывов:', error);
      setReviewCount(0); // безопасно ставим 0, если запрос упал
    }
  };


  useEffect(() => {
    const fetchRoute = async () => {
      try {
        const response = await fetch(`http://localhost:8100/api/route/route/${routeId}`);
        const data = await response.json();
        setRouteData(data);
      } catch (error) {
        console.error('Ошибка загрузки маршрута:', error);
      }
    };

    fetchRoute();
    fetchReviews(); 
  }, [routeId]);

  if (!routeData) return <div>Загрузка...</div>;

  const { user, route, points } = routeData;
  const { name, description, length, duration, rating, images, tags } = route;

  return (
    <div className="route-page">
      <SearchBar />
      <div className="route-card-container">
        <div className="route-header">
          <h2 className="route-name">{name}</h2>
          <div className="route-author">
            <span>{user.name}</span>
            <img
              src={user.image_url ? `http://localhost:8100/api/media/image/${user.image_url}` : 'https://via.placeholder.com/32?text=👤'}
              alt="Автор"
              className="author-avatar"
            />
          </div>
        </div>
        <div className="route-tags">
          {tags?.length > 0 &&
            tags.map((tag) => (
              <span key={tag} className="tag">#{tag}</span>
            ))}
        </div>

        <div className="route-info-layout">
          <div className="route-stats-block">
            <div className="stat-row"><span className="stat-label">Протяженность:</span> {(length / 1000).toFixed(1)} км</div>
            <div className="stat-row"><span className="stat-label">Длительность:</span> {formatDuration(duration / 60)}</div>
            <div className="stat-row"><span className="stat-label">Оценка:</span> {rating}</div>
            <div className="stat-row"><span className="stat-label">Отзывов:</span> {reviewCount ?? '...'}</div>
          </div>

          <div className="route-description-block">
            <div className="description-label">Описание:</div>{description && <p className="route-description">{description}</p>}
          </div>
        </div>

  
        <div className="route-images">
          {images?.map((img, idx) => (
            <img
              key={idx}
              src={`http://localhost:8100/api/media/image/${img}`}
              alt={`img-${idx}`}
              className="route-image"
            />
          ))}
        </div>
  
        <h3 className="points-title">Точки маршрута</h3>
        <div className="route-points">
          {points.map((point, index) => (
            <div key={point.point_id} className="point-card">
              {point.images?.[0] && <img src={point.images[0]} alt={`point-${index}`} />}
              <p>{point.point_description || `Точка ${index + 1}`}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default RoutePage;
