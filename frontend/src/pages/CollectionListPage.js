import React from 'react';
import Button from '../components/button/button';

const CollectionListPage = () => {
  return (
    <div>
      <h2>Список коллекций</h2>
      <Button label="Все маршруты" variant="black" onClick={() => alert('Все маршруты')} />
    </div>
  );
};

export default CollectionListPage;
