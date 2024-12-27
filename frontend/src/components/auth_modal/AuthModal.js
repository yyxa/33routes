import React, { useState } from 'react';
import './AuthModal.css';

const AuthModal = ({ onClose, onLogin }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [username, setUsername] = useState('');
  const [isRegistering, setIsRegistering] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (event) => {
    event.preventDefault();
    setError('');

    const url = isRegistering
      ? 'https://33routes.ru/api/auth/register'
      : 'https://33routes.ru/api/auth/login';
    const body = isRegistering
      ? JSON.stringify({ username, email, password })
      : JSON.stringify({ email, password });

    try {
      const response = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body,
      });

      if (response.ok) {
        const data = await response.json();
        if (isRegistering) {
          console.log('User registered:', data);
        } else {
          console.log('User logged in:', data);
          onLogin(data);
        }
        onClose();
      } else if (response.status === 409) {
        setError('User may already exist');
      } else if (response.status === 401) {
        setError('Unauthorized');
      } else {
        setError('Internal server error');
      }
    } catch (error) {
      console.error('Error:', error);
      setError('An error occurred. Please try again.');
    }
  };

  return (
    <div className="auth-modal-overlay" onClick={onClose}>
      <div
        className="auth-modal"
        onClick={(e) => e.stopPropagation()} // Останавливаем всплытие события
      >
        <div className="close-icon" onClick={onClose}>
          ×
        </div>
        <h2>{isRegistering ? 'Register' : 'Login'}</h2>
        <form onSubmit={handleSubmit}>
          {isRegistering && (
            <input
              type="text"
              placeholder="Username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
            />
          )}
          <input
            type="text"
            placeholder="Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <input
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          <button type="submit">{isRegistering ? 'Register' : 'Login'}</button>
        </form>
        {error && <p style={{ color: 'red' }}>{error}</p>}
        <p onClick={() => setIsRegistering(!isRegistering)}>
          {isRegistering ? 'Already have an account? Login' : 'Need an account? Register'}
        </p>
      </div>
    </div>
  );
};

export default AuthModal;