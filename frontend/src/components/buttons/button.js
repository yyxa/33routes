import React from 'react';
import './button.css';

const Button = ({ label, onClick, baseClass = 'default-button', variant }) => {
  return (
    <button className={`${baseClass} ${variant}`} onClick={onClick}>
      {label}
    </button>
  );
};

export default Button;
