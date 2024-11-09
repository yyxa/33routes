import React, { useState } from 'react';
import './MainPage.css';
import { Helmet } from 'react-helmet-async';

import SearchBar from "../../components/search_bar/searchBar"
import Button from '../../components/buttons/button';

const MainPage = () => {
  const [activeRouteButton, setActiveRouteButton] = useState('МАРШРУТЫ');
  const [activeSortButton, setActiveSortButton] = useState('');

  const handleRouteButtonClick = (buttonType) => {
    setActiveRouteButton(buttonType);
  };

  const handleSortButtonClick = (buttonType) => {
    setActiveSortButton(buttonType);
  };

  return (
    <div className="main-container">
      <Helmet>
        <title>33routes - Главная страница</title>
      </Helmet>
      <header className="header">
        <div className="logo">33routes</div>
        <div className="header-actions">
          <div className="avatar-placeholder">
            <img src={require('./53.jpg')} alt="Аватар" />
          </div>
          <button className="menu-button">...</button>
        </div>
      </header>

      <div className="divider"></div>

      <div className="content">
        <div className="left-panel">
          <SearchBar />

          <div className="button-groups">
            <div className="type-button-container">
              <Button
                label="МАРШРУТЫ" 
                variant={activeRouteButton === 'МАРШРУТЫ' ? 'dark' : 'white'}
                onClick={() => handleRouteButtonClick('МАРШРУТЫ')}
              />
              <Button 
                label="ПОДБОРКИ" 
                variant={activeRouteButton === 'ПОДБОРКИ' ? 'dark' : 'white'}
                onClick={() => handleRouteButtonClick('ПОДБОРКИ')}
              />
            </div>

            <div className="sort-filter-container">
              <Button
                label="СОРТИРОВАТЬ" 
                variant={activeSortButton === 'СОРТИРОВАТЬ' ? 'dark' : 'white'}
                onClick={() => handleSortButtonClick('СОРТИРОВАТЬ')}
              />
              <Button 
                label="ФИЛЬТРЫ" 
                variant={activeSortButton === 'ФИЛЬТРЫ' ? 'dark' : 'white'}
                onClick={() => handleSortButtonClick('ФИЛЬТРЫ')}
              />
            </div>
          </div>
        </div>
        <div className="right-panel">
        </div>
      </div>
    </div>
  );
};

export default MainPage;
