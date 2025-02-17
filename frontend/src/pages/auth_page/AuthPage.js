import React, { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import './AuthPage.css';

const AuthPage = () => {
  const navigate = useNavigate();

  useEffect(() => {
    if (window.VKIDSDK) {
      const VKID = window.VKIDSDK;

      VKID.Config.init({
        app: parseInt(process.env.REACT_APP_VK_APP_ID, 10),
        redirectUrl: 'https://33routes.ru',
        responseMode: VKID.ConfigResponseMode.PostMessage,
        source: VKID.ConfigSource.LOWCODE,
        scope: '',
      });

      const oAuth = new VKID.OAuthList();

      oAuth
        .render({
          container: document.getElementById('vkid-container'),
          oauthList: ['vkid'],
        })
        .on(VKID.WidgetEvents.ERROR, (error) => {
          console.error('VKID Error:', error);
        });

      const handlePostMessage = (event) => {
        if (event.origin === 'https://id.vk.com' && event.data?.code) {
          const { code, device_id } = event.data;

          window.history.replaceState({}, document.title, window.location.pathname);

          console.log('Authorization Code:', code);
          console.log('Device ID:', device_id);
        }
      };

      window.addEventListener('message', handlePostMessage);

      return () => {
        window.removeEventListener('message', handlePostMessage);
      };
    }
  }, [navigate]);

  return (
    <div className="auth-page">
      <h1>Авторизация через ВКонтакте</h1>
      <div id="vkid-container" className="vkid-button-container"></div>
    </div>
  );
};

export default AuthPage;
