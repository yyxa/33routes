import React from 'react';
import Header from '../../components/header/header';
import './PageLayout.css';

const PageLayout = ({ children }) => {
  return (
    <div className="main-container">
      <Header />
      <div className="divider"></div>
      <div className="content">
        {children}
      </div>
    </div>
  );
};

export default PageLayout;
