import React from 'react';
import './roundButton.css';

const RoundButton = ({ onClick }) => {
  return (
    <button className="round-button" onClick={onClick}></button>
  );
};

export default RoundButton;
