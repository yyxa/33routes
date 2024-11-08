import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';
import MainPage from './pages/main_page/MainPage';
import CollectionPage from './pages/CollectionPage';
import RoutePage from './pages/RoutePage';
import CollectionListPage from './pages/CollectionListPage';
import Header from './components/header/header';

const App = () => {
  return (
    <HelmetProvider>
      <Router>
        <div className="content">
          <Routes>
            <Route path="/" element={<MainPage />} />
            <Route path="/collections" element={<CollectionListPage />} />
            <Route path="/collection/:id" element={<CollectionPage />} />
            <Route path="/route/:id" element={<RoutePage />} />
          </Routes>
        </div>
      </Router>
    </HelmetProvider>
  );
};

export default App;
