import React from 'react';
import './filterButton.css';

const FilterButton = ({ onClick }) => {
  return (
    <button className="filter-button" onClick={onClick}>
      <svg viewBox="0 0 24 24" width="20" height="20">
        <path d="M10 18h4v-2h-4v2zm-7-5h18v-2H3v2zm3-7v2h12V6H6z" />
      </svg>
    </button>
  );
};

export default FilterButton;
