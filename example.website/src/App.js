import React, { useEffect, useState } from "react"

import logo from './logo.svg';
import './App.css';

function App() {

  const [users, setUsers] = useState([])

  const fetchData = () => {

    fetch("http://localhost:3001/uuid")
      .then(response => {
        return response.json()
      })
      .then(data => {
        setUsers(data)
      })
  }

  useEffect(() => {
    fetchData()
  }, [])

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
          <div>
            {users.length > 0 && (
              <ul>
                {users.map(user => (
                  <li key={user.id}>{user.name}</li>
                ))}
              </ul>
            )}
          </div>
        </p>
      </header>
    </div>
  );
}

export default App;
