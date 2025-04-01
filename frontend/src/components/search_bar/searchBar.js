import React from 'react';
import './searchBar.css';

const SearchBar = ({ value, onSearch }) => {
  const handleInputChange = (e) => {
    if (onSearch) onSearch(e.target.value);
  };

  return (
    <div className="search-bar-enhanced">
      <span className="search-icon-enhanced" />
      <input
        type="text"
        className="search-input-enhanced"
        placeholder="Найти маршрут или подборку..."
        value={value}
        onChange={handleInputChange}
      />
    </div>
  );
};

export default SearchBar;
