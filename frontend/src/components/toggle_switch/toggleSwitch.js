import React, { useState } from 'react';
import './toggleSwitch.css';

const ToggleSwitch = () => {
  const [isOn, setIsOn] = useState(false);

  const toggleSwitch = () => {
    setIsOn(!isOn);
  };

  return (
    <label className="toggle-switch">
      <input type="checkbox" checked={isOn} onChange={toggleSwitch} />
      <span className="slider"></span>
    </label>
  );
};

export default ToggleSwitch;
