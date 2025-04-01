import React from 'react';
import './header.css';

const Header = ({ onLoginClick, user }) => {
  const handleAvatarClick = () => {
    if (!user) {
      console.log("Opening AuthModal...");
      if (onLoginClick) {
        onLoginClick();
      }
    } else {
      console.log("User is already logged in.");
    }
  };

  const handleMenuClick = () => {
    console.log("Menu clicked!");
  };

  return (
    <div className="header-container">
      <header className="header">
        <div className="logo">
          <a href="/" style={{ textDecoration: 'none' }}>
            <div className="logo-icon" />
          </a>
        </div>
        <div className="header-actions">
          <div className="avatar-placeholder" onClick={handleAvatarClick}>
            <span>{user ? user.name : 'Login'}</span>
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
