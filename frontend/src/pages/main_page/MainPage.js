import React from 'react';
import './mainPage.css'; // Файл для стилей страницы

const MainPage = () => {
  return (
    <div className="main-container">
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
