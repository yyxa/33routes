import React, { useEffect, useState } from 'react';
import { useOutletContext } from 'react-router-dom';
import { useParams } from 'react-router-dom';
import SearchBar from '../../components/search_bar/searchBar';
import CommentCard from '../../components/comment_card/commentCard';
import showIcon from './images/show.svg';
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
  // const [isVisible, setIsVisible] = useState(false);
  const { toggleRouteOnMap } = useOutletContext();

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
    toggleRouteOnMap(routeId);
  }, [routeId]);
  
  // const handleToggleRoute = () => {
  //   toggleRouteOnMap(routeId);  // Вызываем функцию отображения / скрытия маршрута
  //   setIsVisible(!isVisible);
  // };

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
          {points
            .filter(point => point.images && point.images.length > 0) // Фильтр: только точки с images !== null и не пустым массивом
            .map((point, index) => (
              <div key={point.point_id} className="point-card">
                <img
                  src={`http://localhost:8100/api/media/image/${point.images[0]}`} // Формируем URL для первого изображения
                  alt={`Точка ${index + 1}`}
                  className="point-image"
                />
                <p>{point.point_description || `Точка ${index + 1}`}</p>
              </div>
            ))}
          {points.filter(point => point.images && point.images.length > 0).length === 0 && (
            <p className="no-images-message">Нет точек с изображениями</p>
          )}
        </div>
        {/* <button
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
        </button> */}
      </div>
    </div>
  );
};

export default RoutePage;
