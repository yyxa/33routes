import React from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import './ImageViewer.css';

const ImageViewer = () => {
  const { imageName } = useParams();
  const navigate = useNavigate();
  const imageUrl = `http://localhost:8100/api/media/image/${imageName}`;

  return (
    <div className="image-overlay" onClick={() => navigate(-1)}>
      <div className="image-container" onClick={(e) => e.stopPropagation()}>
        <img src={imageUrl} alt="full" />
        <span className="close-button" onClick={() => navigate(-1)}>×</span>
      </div>
    </div>
  );
};

export default ImageViewer;
