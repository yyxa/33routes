import React from 'react';
import SearchBar from '../components/search_bar/searchBar';
import Button from '../components/button/button';
import ToggleSwitch from '../components/toggle_switch/toggleSwitch';
import RoundButton from '../components/round_button/roundButton';
import Dropdown from '../components/dropdown/dropdown';

const MainPage = () => {
  return (
    <div>
      <h1>Главная страница</h1>
      <SearchBar placeholder="Поиск маршрутов..." />
      <Button label="Маршруты" variant="white" onClick={() => alert('Маршруты')} />
      <Button label="Подборки" variant="black" onClick={() => alert('Подборки')} />
      <ToggleSwitch onToggle={(isOn) => console.log(`Переключатель: ${isOn ? 'Включен' : 'Выключен'}`)} />
      <RoundButton onClick={() => alert('Пользователь')} />
      <Dropdown options={[{ value: '1', label: 'Опция 1' }, { value: '2', label: 'Опция 2' }]} onSelect={(option) => console.log(`Выбрана ${option.label}`)} />
    </div>
  );
};

export default MainPage;
