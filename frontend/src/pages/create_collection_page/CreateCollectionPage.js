import React, { useState } from 'react';
import './CreateCollectionPage.css';

const CreateCollectionPage = () => {
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [selectedTags, setSelectedTags] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [notification, setNotification] = useState(null);

  const availableTags = ['forest', 'park', 'nearwater'];

  const showNotification = (message, type = 'success') => {
    setNotification({ message, type });
    setTimeout(() => setNotification(null), 4000);
  };

  const handleTagToggle = (tag) => {
    if (selectedTags.includes(tag)) {
      setSelectedTags(selectedTags.filter(t => t !== tag));
    } else {
      setSelectedTags([...selectedTags, tag]);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsLoading(true);

    const body = {
      name,
      description,
      tags: selectedTags,
    };

    try {
      const res = await fetch('http://localhost:8100/api/collection/collection', {
        method: 'POST',
        credentials: 'include',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body),
      });

      if (res.status === 201) {
        showNotification('Подборка успешно создана!');
        setName('');
        setDescription('');
        setSelectedTags([]);
      } else {
        const errorData = await res.json();
        showNotification(errorData.message || 'Ошибка при создании подборки', 'error');
      }
    } catch (err) {
      console.error(err);
      showNotification('Ошибка сети или сервера', 'error');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="create-collection-page">
      {notification && (
        <div className={`notification ${notification.type}`}>
          {notification.message}
        </div>
      )}
      
      <div className="create-form-card">
        <h2>Создание подборки</h2>
        <form onSubmit={handleSubmit}>
          <input
            type="text"
            placeholder="Название"
            value={name}
            onChange={(e) => setName(e.target.value)}
            required
          />
          <textarea
            placeholder="Описание"
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            rows="4"
            required
          />
          
          <div className="tags-section">
            <h3>Теги</h3>
            <div className="tags-container">
              {availableTags.map(tag => (
                <button
                  type="button"
                  key={tag}
                  className={`tag-button ${selectedTags.includes(tag) ? 'selected' : ''}`}
                  onClick={() => handleTagToggle(tag)}
                >
                  {getTagDisplayName(tag)}
                </button>
              ))}
            </div>
          </div>

          <button 
            type="submit" 
            disabled={isLoading}
            className={isLoading ? 'loading' : ''}
          >
            {isLoading ? 'Создание...' : 'Создать'}
          </button>
        </form>
      </div>
    </div>
  );
};

const getTagDisplayName = (tag) => {
  const tagNames = {
    forest: 'Лес',
    park: 'Парк',
    nearwater: 'У воды'
  };
  return tagNames[tag] || tag;
};

export default CreateCollectionPage;