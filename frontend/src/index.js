import React, { useState } from "react";
import { createRoot } from 'react-dom/client';
import App from "./App";
import "./index.css";

const Root = () => {
  const [user, setUser] = useState(null);
  return <App user={user} setUser={setUser} />;
};

const root = createRoot(document.getElementById('root'));
root.render(<Root />);
