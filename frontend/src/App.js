import React, { useState } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';

import RootLayout from './layouts/RootLayout'; 
import SearchPage from './pages/search_page/SearchPage';
import RoutePage from './pages/route_page/RoutePage';
import CollectionPage from './pages/collection_page/CollectionPage';
import AuthModal from './components/auth_modal/AuthModal';

function App() {
  const [user, setUser] = useState(null);          // текущее состояние авторизации
  const [showAuthModal, setShowAuthModal] = useState(false); // показывать ли модалку

  // Функция «открыть модалку»
  const openAuthModal = () => {
    console.log("AuthModal should open now."); // Отладочное сообщение
    setShowAuthModal(true);
  };

  // Функция «закрыть модалку»
  const closeAuthModal = () => {
    setShowAuthModal(false);
  };

  // Функция «авторизовать»
  const handleLogin = (userData) => {
    setUser(userData);
    setShowAuthModal(false);
  };

  // Функция «разлогин»
  const handleLogout = () => {
    setUser(null);
  };

  return (
    <HelmetProvider>
      <BrowserRouter>
        {showAuthModal && (
          <AuthModal 
            onClose={closeAuthModal}
            onLogin={handleLogin}
          />
        )}
        
        <Routes>
          <Route 
            path="/" 
            element={
              <RootLayout
                user={user}
                onLoginClick={openAuthModal}
                onLogoutClick={handleLogout}
              />
            }
          >
            <Route index element={<SearchPage />} />
            <Route path="route/:routeId" element={<RoutePage />} />
            <Route path="collection/:collectionId" element={<CollectionPage />} />
          </Route>
        </Routes>
      </BrowserRouter>
    </HelmetProvider>
  );
}

export default App;
