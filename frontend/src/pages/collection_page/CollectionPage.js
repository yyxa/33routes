import React, { useEffect, useState } from 'react';
import Button from '../../components/buttons/button';
import { useParams } from 'react-router-dom';
import ToggleSwitch from '../../components/toggle_switch/toggleSwitch';
import './CollectionPage.css';

const CollectionPage = () => {
  const { collectionId } = useParams();
  const [collectionData, setCollectionData] = useState(null);

  useEffect(() => {
    const fetchCollection = async () => {
      try {
        const response = await fetch(`http://localhost:8100/api/collection/collection/${collectionId}`);
        const data = await response.json();
        setCollectionData(data);
      } catch (error) {
        console.error('Ошибка загрузки коллекции:', error);
      }
    };

    fetchCollection();
  }, [collectionId]);

  if (!collectionData) return <div>Загрузка...</div>;

  const { user, collection } = collectionData;
  const { name, description, tags, rating, routes } = collection;

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
        
        <div className="route-list">
          {/* {routes.map((r) => ( */}
          {/*   <RouteCard */}
          {/*     key={r.id} */}
          {/*       {...r} */}
          {/*       onOpenRouteDetail={handleOpenRouteDetail} */}
          {/*   /> */}
          {/* ))} */}
          {/* </div> */}
        </div>
      </div>
    </div>
  );
};

export default CollectionPage;
