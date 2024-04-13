import { useState } from 'react';
import './App.css'
import Login from './components/Login';
import Menu from './components/Menu';

function App() {
  const [loggedUser, setLoggedUser] = useState(false);
  const [user, setUser] = useState("");

  const updateUser = (val: string) => {
    setUser(val);
    if(val.length > 0) {
      setLoggedUser(true);
    } else {
      setLoggedUser(false);
    }
  }

  return (
    <>
      <div className="App">
        { (!loggedUser) ? ( <Login updateLoggedUser={updateUser} /> ) : ( <Menu updateLoggedUser={updateUser} /> )  } 
      </div>
    </>
  )
}

export default App
