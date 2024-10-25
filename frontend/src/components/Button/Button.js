import React from 'react';
import './button.css';

const Button = ({ label, onClick, variant }) => {
  return (
    <button className={`button ${variant}`} onClick={onClick}>
      {label}
    </button>
  );
};

export default Button;
