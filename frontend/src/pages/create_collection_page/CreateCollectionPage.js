import React, { useState } from 'react';
import './CreateCollectionPage.css';

const CreateCollectionPage = () => {
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    const body = {
      name,
      description,
      tags: [],
    };

    try {
      const res = await fetch('http://localhost:8100/api/collection/collection', {
        method: 'POST',
        credentials: 'include',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body),
      });

      if (res.status === 201) {
        alert('Подборка создана!');
        setName('');
        setDescription('');
      } else {
        alert('Ошибка при создании подборки');
      }
    } catch (err) {
      console.error(err);
      alert('Ошибка запроса');
    }
  };

  return (
    <div className="create-collection-page">
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
          <button type="submit">Создать</button>
        </form>
      </div>
    </div>
  );
};

export default CreateCollectionPage;
