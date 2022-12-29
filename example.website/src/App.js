import React, { useEffect, useState } from "react"

import logo from './logo.svg';
import './App.css';

const { REACT_APP_API_HOST } = process.env

//need to set things like this https://www.freecodecamp.org/news/how-to-implement-runtime-environment-variables-with-create-react-app-docker-and-nginx-7f9d42a91d70/

function App() {

  const [users, setUsers] = useState([])

  const fetchData = () => {

    fetch(`${REACT_APP_API_HOST}/uuid`)
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
