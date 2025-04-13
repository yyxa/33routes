import React, { useState, useEffect } from 'react';
import {
  BrowserRouter,
  Routes,
  Route,
  useLocation,
  useNavigate,
} from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';

import RootLayout from './layouts/RootLayout';
import SearchPage from './pages/search_page/SearchPage';
import RoutePage from './pages/route_page/RoutePage';
import CollectionPage from './pages/collection_page/CollectionPage';
import AuthPage from './pages/auth_page/AuthPage';
import ImageViewer from './components/image_viewer/ImageViewer';
import UserPage from './pages/user_page/UserPage';
import CreateRoutePage from './pages/create_route_page/CreateRoutePage';
import CreateCollectionPage from './pages/create_collection_page/CreateCollectionPage';

function AppContent() {
  const [user, setUser] = useState(() => {
    const saved = localStorage.getItem('user');
    return saved ? JSON.parse(saved) : null;
  });

  const location = useLocation();
  const navigate = useNavigate();

  const state = location.state;
  const backgroundLocation = state?.backgroundLocation;
  const isModalAuth = location.pathname === '/auth';

  useEffect(() => {
    const check = async () => {
      try {
        const res = await fetch('http://localhost:8100/api/user/me', {
          method: 'GET',
          credentials: 'include',
          headers: { 'Content-Type': 'application/json' },
        });
        if (!res.ok) throw new Error();
        const data = await res.json();
        setUser(data);
        localStorage.setItem('user', JSON.stringify(data));
      } catch {
        setUser(null);
        localStorage.removeItem('user');
      }
    };
    check();
  }, []);

  const handleLogin = (data) => {
    setUser(data);
    localStorage.setItem('user', JSON.stringify(data));
    navigate(backgroundLocation?.pathname || '/', { replace: true });
  };

  const handleLogout = () => {
    setUser(null);
    localStorage.removeItem('user');
    document.cookie =
      'session_token=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
    navigate('/');
  };

  return (
    <>
      {/* 🔥 При прямом заходе на /auth вручную рисуем SearchPage как фон */}
      {isModalAuth && !backgroundLocation && (
        <RootLayout
          user={user}
          onLoginClick={() =>
            navigate('/auth', { state: { backgroundLocation: location } })
          }
          onLogoutClick={handleLogout}
        >
          <SearchPage />
        </RootLayout>
      )}

      {/* Остальные маршруты */}
      <Routes location={backgroundLocation || location}>
        <Route
          path="/"
          element={
            <RootLayout
              user={user}
              onLoginClick={() =>
                navigate('/auth', { state: { backgroundLocation: location } })
              }
              onLogoutClick={handleLogout}
            />
          }
        >
          <Route index element={<SearchPage />} />
          <Route path="route/:routeId" element={<RoutePage />} />
          <Route path="collection/:collectionId" element={<CollectionPage />} />
          <Route path="user/:username" element={<UserPage />} />
          <Route path="create/route" element={<CreateRoutePage />} />
          <Route path="create/collection" element={<CreateCollectionPage />} />
        </Route>
        <Route path="/image/:imageName" element={<ImageViewer />} />
      </Routes>

      {/* 🔥 Модалка авторизации (всегда) */}
      {isModalAuth && <AuthPage onLogin={handleLogin} />}
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
