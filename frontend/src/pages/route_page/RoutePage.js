import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import SearchBar from '../../components/search_bar/searchBar';
import CommentCard from '../../components/comment_card/commentCard';
import './RoutePage.css';

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
  
      const comments = data?.comments || []; // <- если нет comments — делаем пустой массив
      console.log("💬 Загруженные отзывы:", comments);
  
      setReviewCount(comments.length);
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
        setReviewCount(data.comments.length);
      } catch (error) {
        console.error('Ошибка загрузки маршрута:', error);
      }
    };

    fetchRoute();
  }, [routeId]);

  if (!routeData) return <div>Загрузка...</div>;

  const { user, route, points } = routeData;
  const { name, description, length, duration, rating, images } = route;

  return (
    <div className="route-page">
      <SearchBar />
      <div className="route-card-container">
        <div className="route-header">
          <h2 className="route-name">{name}</h2>
          <div className="route-author">
            <span>{user.name}</span>
            <img src={user.image_url} alt="Автор" className="author-avatar" />
          </div>
        </div>
        <div className="route-stats">
        <div className="route-stats">
          <div className="row">
            <span className="stat km">{(length/1000).toFixed(1)} км</span>
            <span className="stat rating">{rating} ★</span>
          </div>
          <div className="row">
            <span className="stat time">{(duration / 60).toFixed(1)} мин</span>
            <span className="stat reviews">
              {reviewCount !== null ? `${reviewCount} отзыв${getPluralForm(reviewCount)}` : '...'}
            </span>
          </div>
        </div>

        </div>

        <p className="description-label">Описание:<br /></p>
        <p className="route-description">{description}</p>
  
        <div className="route-images">
          {images?.map((img, idx) => (
            <img key={idx} src={img} alt={`img-${idx}`} className="route-image" />
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
