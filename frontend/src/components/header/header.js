import React from 'react';
import './header.css';

const Header = ({ onLoginClick, user }) => {
  const handleAvatarClick = () => {
    if (!user) { // Проверяем, авторизован ли пользователь
      console.log("Opening AuthModal..."); // Отладочное сообщение
      if (onLoginClick) {
        onLoginClick(); // Вызываем функцию для открытия модального окна
      }
    } else {
      console.log("User is already logged in."); // Здесь можно добавить логику для авторизованного пользователя
    }
  };

  const handleMenuClick = () => {
    console.log("Menu clicked!");
  };

  return (
    <div className="header-container">
      <header className="header">
        <div className="logo">
          <div className="logo-icon"></div>
        </div>
        <div className="header-actions">
          <div className="avatar-placeholder" onClick={handleAvatarClick}>
            <span>{user ? user.name : 'Login'}</span> {/* Показываем имя пользователя, если он авторизован */}
          </div>
          <button className="menu-button" onClick={handleMenuClick}>
            ...
          </button>
        </div>
      </header>
      <div className="divider"></div>
    </div>
  );
};

export default Header;
