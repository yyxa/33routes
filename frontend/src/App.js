import React, { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';

import RootLayout from './layouts/RootLayout';
import SearchPage from './pages/search_page/SearchPage';
import RoutePage from './pages/route_page/RoutePage';
import CollectionPage from './pages/collection_page/CollectionPage';
import AuthModal from './components/auth_modal/AuthModal';

function App() {
  const [user, setUser] = useState(() => {
    const savedUser = localStorage.getItem("user");
    return savedUser ? JSON.parse(savedUser) : null;
  });

  const [showAuthModal, setShowAuthModal] = useState(false);

  useEffect(() => {
    const checkSession = async () => {
      try {
        const response = await fetch("http://localhost:8100/api/auth/check_token", {
          method: "POST",
          credentials: "include",
          headers: { "Content-Type": "application/json" },
        });
  
        if (!response.ok) {
          setUser(null);
          localStorage.removeItem("user");
          return;
        }
  
        const data = await response.json();
        setUser(data);
        localStorage.setItem("user", JSON.stringify(data));
      } catch (error) {
        setUser(null);
        localStorage.removeItem("user");
      }
    };
  
    checkSession();
  }, []);

  // Функция «открыть модалку»
  const openAuthModal = () => {
    setShowAuthModal(true);
  };

  // Функция «закрыть модалку»
  const closeAuthModal = () => {
    setShowAuthModal(false);
  };

  // Функция «авторизовать»
  const handleLogin = (userData) => {
    setUser(userData);
    localStorage.setItem("user", JSON.stringify(userData));
    setShowAuthModal(false);
  };

  // Функция «разлогин»
  const handleLogout = () => {
    setUser(null);
    localStorage.removeItem("user");
    document.cookie = "session_token=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
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
