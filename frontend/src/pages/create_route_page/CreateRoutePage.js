import React, { useState } from 'react';

const CreateRoutePage = () => {
  const [formData, setFormData] = useState({
    name: '',
    description: '',
    length: '',
    duration: '',
    category: 'walking',
    points: [],
    tags: [],
    images: [],
  });

  const handleSubmit = async (e) => {
    e.preventDefault();

    const body = {
      ...formData,
      length: parseInt(formData.length) * 1000,
      duration: parseInt(formData.duration) * 3600,
      points: [
        {
          latitude: 55.751244,
          longitude: 37.618423,
        },
      ],
    };

    try {
      const res = await fetch('http://localhost:8100/api/route/route', {
        method: 'POST',
        credentials: 'include',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body),
      });

      if (res.status === 201) {
        alert('Маршрут успешно создан');
      } else {
        alert('Ошибка при создании маршрута');
      }
    } catch (err) {
      console.error(err);
      alert('Ошибка запроса');
    }
  };

  return (
    <div style={{ padding: 20 }}>
      <h1>Создание маршрута</h1>
      <form onSubmit={handleSubmit}>
        <input placeholder="Название" value={formData.name} onChange={(e) => setFormData({ ...formData, name: e.target.value })} />
        <textarea placeholder="Описание" value={formData.description} onChange={(e) => setFormData({ ...formData, description: e.target.value })} />
        <input placeholder="Длина (км)" type="number" value={formData.length} onChange={(e) => setFormData({ ...formData, length: e.target.value })} />
        <input placeholder="Продолжительность (часы)" type="number" value={formData.duration} onChange={(e) => setFormData({ ...formData, duration: e.target.value })} />
        <select value={formData.category} onChange={(e) => setFormData({ ...formData, category: e.target.value })}>
          <option value="walking">Пеший</option>
        </select>
        <button type="submit">Создать</button>
      </form>
    </div>
  );
};

export default CreateRoutePage;