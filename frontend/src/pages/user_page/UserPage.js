import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

const UserPage = () => {
  const { username } = useParams();
  const [profile, setProfile] = useState(null);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchUser = async () => {
      try {
        const res = await fetch(`http://localhost:8100/api/user/${username}`);
        if (!res.ok) throw new Error('Пользователь не найден');
        const data = await res.json();
        setProfile(data);
      } catch (err) {
        setError(err.message);
      }
    };

    fetchUser();
  }, [username]);

  if (error) return <div>{error}</div>;
  if (!profile) return <div>Загрузка...</div>;

  return (
    <div className="user-page">
      <h2>{profile.name} {profile.surname}</h2>
      <img
        src={`http://localhost:8100/api/media/image/${profile.avatar_url || 'default-avatar.svg'}`}
        alt="аватар"
        style={{ width: 100, borderRadius: '50%' }}
      />
      <p>@{profile.username}</p>
      {profile.bio && <p>{profile.bio}</p>}
    </div>
  );
};

export default UserPage;
