import React from 'react';
import './header.css';
import SearchBar from '../search_bar/searchBar';

const Header = ({
  query,
  onQueryChange,
  type,
  onTypeChange,
  onFilterToggle,
}) => {
  return (
    <div className="header-container">
      <header className="header">
        <div className="logo">
          <a href="/" className="logo-link">
            <div className="logo-icon" />
          </a>
        </div>
        <div className="toggle-buttons">
          <button
            className={`btn-search ${type === 'routes' ? 'active' : ''}`}
            onClick={() => onTypeChange('routes')}
          >
            Маршруты
          </button>
          <button
            className={`btn-search ${type === 'collections' ? 'active' : ''}`}
            onClick={() => onTypeChange('collections')}
          >
            Подборки
          </button>
        </div>
        <div className="search-wrapper">
          <SearchBar value={query} onSearch={onQueryChange} />
        </div>
        <button className="btn-search filter-button" onClick={onFilterToggle}>
          <svg viewBox="0 0 24 24" width="20" height="20">
            <path d="M10 18h4v-2h-4v2zm-7-5h18v-2H3v2zm3-7v2h12V6H6z" />
          </svg>
        </button>
      </header>
      <div className="divider" />
    </div>
  );
};

export default Header;
