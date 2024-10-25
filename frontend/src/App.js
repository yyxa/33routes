// App.js
import React from 'react';
import SearchBar from './components/search_bar/searchBar';
import Dropdown from './components/dropdown/dropdown';
import RoundButton from './components/round_button/roundButton';
import ToggleSwitch from './components/toggle_switch/toggleSwitch';
import Button from './components/button/button';

const App = () => {
  const options = [
    { value: 'option1', label: 'Опция 1' },
    { value: 'option2', label: 'Опция 2' },
    { value: 'option3', label: 'Опция 3' },
  ];

  const handleSearch = (term) => {
    console.log(`Поиск по запросу: ${term}`);
  };

  const handleSelect = (option) => {
    console.log(`Выбрана опция: ${option.label}`);
  };

  const handleOutlinedButtonClick = () => {
    alert('Белая кнопка нажата!');
  };

  const handleFilledButtonClick = () => {
    alert('Черная кнопка нажата!');
  };

  const handleUserClick = () => {
    alert('Кнопка пользователя нажата');
  };

  const handleMenuClick = () => {
    alert('Кнопка меню нажата');
  };

  const handleToggle = (isOn) => {
    console.log(`Переключатель: ${isOn ? 'Включен' : 'Выключен'}`);
  };

  return (
    <div style={{ padding: '20px' }}>
      <h1>Все компоненты на одной странице</h1>

      {/* Компонент строки поиска */}
      <div style={{ marginBottom: '20px' }}>
        <SearchBar onSearch={handleSearch} />
      </div>

      {/* Компонент выпадающего списка */}
      <div style={{ marginBottom: '20px' }}>
        <Dropdown options={options} onSelect={handleSelect} />
      </div>

      {/* Круглые кнопки */}
      <div style={{ marginBottom: '20px', display: 'flex', gap: '10px' }}>
        <RoundButton onClick={handleUserClick} />
      </div>

      {/* Две версии обычных кнопок */}
      <div style={{ marginBottom: '20px', display: 'flex', gap: '10px' }}>
        <Button label="Белая кнопка" onClick={handleOutlinedButtonClick} variant="white" />
        <Button label="Черная кнопка" onClick={handleFilledButtonClick} variant="black" />
      </div>

      {/* Переключатель */}
      <div style={{ marginBottom: '20px' }}>
        <ToggleSwitch onToggle={handleToggle} />
      </div>
    </div>
  );
};

export default App;
