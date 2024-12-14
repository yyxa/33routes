import React, { useState } from "react";
import ReactDOM from "react-dom";
import App from "./App";
import "./index.css";

const Root = () => {
  const [user, setUser] = useState(null);

  return <App user={user} setUser={setUser} />;
};

ReactDOM.render(<Root />, document.getElementById("root"));
