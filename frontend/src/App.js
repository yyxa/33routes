import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';
import MainPage from './pages/main_page/MainPage';
import CollectionPage from './pages/collection_page/CollectionPage';
import RoutePage from './pages/route_page/RoutePage';
import CollectionListPage from './pages/collection_list_page/CollectionListPage';
import Header from './components/header/header';
import AuthPage from './pages/auth_page/AuthPage';
import TestPage from './pages/test_page/testPage';

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
            <Route path="/auth" element={<AuthPage />} />
          </Routes>
        </div>
      </Router>
    </HelmetProvider>
  );
};

export default App;
