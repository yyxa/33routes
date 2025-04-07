import React, { useEffect, useState } from 'react';
import Button from '../../components/buttons/button';
import { useParams } from 'react-router-dom';
import ToggleSwitch from '../../components/toggle_switch/toggleSwitch';
import RouteCard from '../../components/route_card/routeCard';
import './CollectionPage.css';

const CollectionPage = () => {
  const { collectionId } = useParams();
  const [collectionData, setCollectionData] = useState(null);

  const [routes, setRoutes] = useState([]);

  useEffect(() => {
    const fetchCollectionAndRoutes = async () => {
      try {
        const res = await fetch(`http://localhost:8100/api/collection/collection/${collectionId}`);

        if (!res.ok) throw new Error("Ошибка при получении коллекции");

        const data = await res.json();
        setCollectionData(data);

        const routeIds = data.collection.routes.ids;

        // грузим маршруты все сразу
        const routesData = await Promise.all(
          routeIds.map(async (routeId) => {
            const r = await fetch(`http://localhost:8100/api/route/route/${routeId}`);
            const d = await r.json();
            return {
              id: d.route.route_id,
              name: d.route.name,
              description: d.route.description,
              length: d.route.length,
              duration: d.route.duration,
              rating: d.route.rating,
              images: (d.route.images || []).map(i => `http://localhost:8100/api/media/image/${i}`),
              authorUsername: d.user.name,
              authorImage: d.user.image_url
                ? `http://localhost:8100/api/media/image/${d.user.image_url}`
                : `http://localhost:8100/api/media/image/default-avatar.svg`,
            };
          })
        );
        setRoutes(routesData);
      } catch (err) {
        console.error("Ошибка при загрузке:", err);
      }
    };

    fetchCollectionAndRoutes();
  }, [collectionId]);

  if (!collectionData) return <div>Загрузка...</div>;

  const { user, collection } = collectionData;
  const { name, description, tags, rating } = collection;

  return (
    <div className="collection-page">
      <div className="collection-card-container">
        <div className="collection-header">
          <h2 className="collection-name">{name}</h2>
          <div className="collection-author">
            <span>{user?.name}</span>
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

        <div className="collection-info-layout">
          <div className="collection-description-block">
            <div className="description-label">
              Описание:
            </div>
            {description && <p className="route-description">{description}</p>}
          </div>
          <div className="collection-stats-block">
            <div className="stat-row"><span className="stat-label">Количество маршрутов: </span>{routes.amount}</div>
            <div className="stat-row"><span className="stat-label">Оценка: </span>{rating}</div>
          </div>
        </div>

        <span className="stat-label">Маршруты:</span>
        
        <div className="routes-list">
          {routes.map((route) => (
            <RouteCard key={route.id} {...route} />
          ))}
        </div>
      </div>
    </div>
  );
};

export default CollectionPage;
