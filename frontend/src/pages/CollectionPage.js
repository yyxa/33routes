import React from 'react';
import Button from '../components/buttons/button';
import ToggleSwitch from '../components/toggle_switch/toggleSwitch';

const CollectionPage = () => {
  return (
    <div>
      <h2>Страница коллекции</h2>
      <Button label="Обзор" variant="white" onClick={() => alert('Обзор')} />
      <ToggleSwitch onToggle={(isOn) => console.log(`Переключатель: ${isOn ? 'Включен' : 'Выключен'}`)} />
    </div>
  );
};

export default CollectionPage;
