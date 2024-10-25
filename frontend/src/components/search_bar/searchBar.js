// components/Search_Bar/SearchBar.js
import React from 'react';
import './searchBar.css';

const SearchBar = ({ onSearch }) => {
  const handleInputChange = (e) => {
    if (onSearch) onSearch(e.target.value);
  };

  return (
    <div className="search-bar">
      <span className="search-icon"></span> {/* Иконка лупы слева */}
      <input
        type="text"
        className="search-input"
        placeholder="Поиск..."
        onChange={handleInputChange}
      />
    </div>
  );
};

export default SearchBar;
