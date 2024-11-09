import React from 'react';
import SearchBar from '../components/search_bar/searchBar';
import Button from '../components/buttons/button';

const RoutePage = () => {
  return (
    <div>
      <h2>Страница маршрута</h2>
      <SearchBar placeholder="Поиск в маршруте..." />
      <Button label="Назад" variant="white" onClick={() => alert('Назад')} />
    </div>
  );
};

export default RoutePage;
