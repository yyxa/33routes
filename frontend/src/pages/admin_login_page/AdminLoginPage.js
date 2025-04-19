import React, { useState } from "react";
import "./AdminLoginPage.css";

const AdminLoginPage = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [errorMsg, setErrorMsg] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    setErrorMsg("");

    try {
      const res = await fetch("http://localhost:8100/api/admin/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ username, password }),
      });

      if (!res.ok) {
        const errText = await res.text();
        setErrorMsg(errText || "Login failed");
        return;
      }

      window.location.href = "/admin/dashboard";
    } catch (err) {
      setErrorMsg("Ошибка соединения с сервером");
    }
  };

  return (
    <div className="container">
      <h2 className="title">Admin Login</h2>
      <form onSubmit={handleSubmit} className="form">
        <div className="formGroup">
          <label className="label">Username</label>
          <input
            className="input"
            type="text"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
            required
          />
        </div>

        <div className="formGroup">
          <label className="label">Password</label>
          <input
            className="input"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </div>

        <button className="button" type="submit">
          Login
        </button>

        {errorMsg && <div className="error">{errorMsg}</div>}
      </form>
    </div>
  );
};

export default AdminLoginPage;

