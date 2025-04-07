import React, { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route, useLocation } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';

import RootLayout from './layouts/RootLayout';
import SearchPage from './pages/search_page/SearchPage';
import RoutePage from './pages/route_page/RoutePage';
import CollectionPage from './pages/collection_page/CollectionPage';
import AuthModal from './components/auth_modal/AuthModal';
import ImageViewer from './components/image_viewer/ImageViewer';
import UserPage from './pages/user_page/UserPage';

function AppContent() {
  const [user, setUser] = useState(() => {
    const savedUser = localStorage.getItem("user");
    return savedUser ? JSON.parse(savedUser) : null;
  });

  const [showAuthModal, setShowAuthModal] = useState(false);
  const location = useLocation();
  const state = location.state;

  useEffect(() => {
    const checkSession = async () => {
      try {
        const response = await fetch("http://localhost:8100/api/user/me", {
          method: "GET",
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

  const openAuthModal = () => setShowAuthModal(true);
  const closeAuthModal = () => setShowAuthModal(false);
  const handleLogin = (userData) => {
    setUser(userData);
    localStorage.setItem("user", JSON.stringify(userData));
    closeAuthModal();
  };
  const handleLogout = () => {
    setUser(null);
    localStorage.removeItem("user");
    document.cookie = "session_token=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
  };

  const backgroundLocation = state?.backgroundLocation || (location.pathname.startsWith("/image/") ? { pathname: "/" } : location);

  return (
    <>
      {showAuthModal && (
        <AuthModal onClose={closeAuthModal} onLogin={handleLogin} />
      )}

      <Routes location={backgroundLocation}>
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
          <Route path="user/:username" element={<UserPage />} />
        </Route>
      </Routes>

      {location.pathname.startsWith('/image/') && (
        <Routes>
          <Route path="/image/:imageName" element={<ImageViewer />} />
        </Routes>
      )}
    </>
  );
}

function App() {
  return (
    <HelmetProvider>
      <BrowserRouter>
        <AppContent />
      </BrowserRouter>
    </HelmetProvider>
  );
}

export default App;
