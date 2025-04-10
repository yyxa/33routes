import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
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
  username,
  avatar,
}) => {
  const [routePreviews, setRoutePreviews] = useState([]);

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
                <div><strong>{index + 1}.</strong> {route.name}</div>
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
          <div className="collection-card-images-container">
            <div className="collection-card-images">
              <div className="no-image-placeholder">Нет изображений</div>
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
