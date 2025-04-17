import React, { useState } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import './AuthPage.css';

const AuthPage = ({ onLogin }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [username, setUsername] = useState('');
  const [isRegistering, setIsRegistering] = useState(false);
  const [error, setError] = useState('');

  const navigate = useNavigate();
  const location = useLocation();
  const backgroundLocation = location.state?.backgroundLocation;

  const handleClose = () => {
    navigate(backgroundLocation?.pathname || '/', { replace: true });
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    setError('');

    const url = isRegistering
      ? 'http://localhost:8100/api/auth/register'
      : 'http://localhost:8100/api/auth/login';

    const body = isRegistering
      ? JSON.stringify({ username, email, password })
      : JSON.stringify({ email, password });

    try {
      const response = await fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body,
        credentials: 'include',
      });

      if (response.ok) {
        // Check if response has content before parsing JSON
        const contentLength = response.headers.get('Content-Length');
        if (contentLength && parseInt(contentLength) > 0) {
          const data = await response.json();
          onLogin?.(data);
        } else {
          // For responses with no body but successful status
          onLogin?.({ success: true });
        }
        
        window.location.reload();
        // Redirect back
        navigate(backgroundLocation?.pathname || '/', { replace: true });
      } else {
        // Handle different error statuses
        if (response.status === 409) {
          setError('Пользователь уже существует');
        } else if (response.status === 401) {
          setError('Неверный email или пароль');
        } else {
          // Try to get error message from response if available
          try {
            const errorData = await response.json();
            setError(errorData.error || 'Ошибка сервера');
          } catch {
            setError(`Ошибка: ${response.status}`);
          }
        }
      }
    } catch (err) {
      console.error('Ошибка:', err);
      setError('Ошибка сети');
    }
  };

  return (
    <div className="auth-page-overlay" onClick={handleClose}>
      <div className="auth-page" onClick={(e) => e.stopPropagation()}>
        <div className="close-icon" onClick={handleClose}>×</div>
        <h2>{isRegistering ? 'Регистрация' : 'Вход'}</h2>
        <form onSubmit={handleSubmit}>
          {isRegistering && (
            <input
              type="text"
              placeholder="Имя пользователя"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
            />
          )}
          <input
            type="email"
            placeholder="Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <input
            type="password"
            placeholder="Пароль"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          <button type="submit">{isRegistering ? 'Зарегистрироваться' : 'Войти'}</button>
        </form>
        {error && <p style={{ color: 'red' }}>{error}</p>}
        <p onClick={() => setIsRegistering(!isRegistering)}>
          {isRegistering ? 'Уже есть аккаунт? Войти' : 'Нет аккаунта? Зарегистрироваться'}
        </p>
      </div>
    </div>
  );
};

export default AuthPage;