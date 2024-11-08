import React from 'react';
import './mainPage.css'; // Файл для стилей страницы
import { Helmet } from 'react-helmet-async';

const MainPage = () => {
  return (
    <div className="main-container">
      <Helmet>
        <title>33routes - Главная страница</title>
      </Helmet>
      {/* Шапка */}
      <header className="header">
        <div className="logo">33routes</div>
        <div className="header-actions">
          {/* Место для аватара */}
          <div className="avatar-placeholder">
            <img src={require('./53.jpg')} alt="Аватар" />
          </div>
          <button className="menu-button">...</button>
        </div>
      </header>

      {/* Разделительная полоска */}
      <div className="divider"></div>

      {/* Основная часть */}
      <div className="content">
        {/* Пустой блок для контента */}
      </div>
    </div>
  );
};

export default MainPage;
