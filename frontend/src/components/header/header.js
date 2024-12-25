import React from 'react';
import { useNavigate } from 'react-router-dom';
import './header.css';

const Header = () => {
  const navigate = useNavigate();

  const handleAvatarClick = () => {
    navigate('/auth');
  };

  const handleMenuClick = () => {
    console.log("Menu clicked!");
  };

  return (
    <div className="header-container">
      <header className="header">
        <div class="logo">
          <div class="logo-icon"></div>
        </div>
        <div className="header-actions">
          <div className="avatar-placeholder" onClick={handleAvatarClick}>
            <span>Login</span>
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
