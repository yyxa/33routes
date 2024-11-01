import React from 'react';
import { Link } from 'react-router-dom';
import './header.css';

const Header = () => {
  return (
    <header className="header">
      <div className="logo">
        <h1>33routes</h1>
      </div>
      <nav className="nav">
        <Link to="/">Главная</Link>
        <Link to="/collections">Коллекции</Link>
        <Link to="/route/1">Маршрут</Link>
      </nav>
    </header>
  );
};

export default Header;
