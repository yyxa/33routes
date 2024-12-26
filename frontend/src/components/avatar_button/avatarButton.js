import React from 'react';
import PropTypes from 'prop-types';
import './avatarButton.css';

const AvatarButton = ({ imageSrc, altText, onClick, className }) => {
  return (
    <button className={`avatar-button ${className}`} onClick={onClick}>
      <img src={imageSrc} alt={altText} className="avatar-image" />
    </button>
  );
};

AvatarButton.propTypes = {
  imageSrc: PropTypes.string.isRequired,
  altText: PropTypes.string.isRequired,
  onClick: PropTypes.func.isRequired,
  className: PropTypes.string,
};

AvatarButton.defaultProps = {
  className: '',
};

export default AvatarButton;
