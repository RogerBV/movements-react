import './App.css'
import { Routes, Route } from "react-router-dom"
import FileUploadScreen from './components/Movements/FileUploadScreen'
import PieReportScreen from './components/Movements/PieReportScreen'
import ManualMovementRegisterScreen from './components/Movements/ManualMovementRegisterScreen'
import BalancesScreen from './components/BalancesScreen'
import CardListScreen from './components/CardListScreen'
import FamiliesScreen from './components/Family/FamiliesScreen'

function App() {

  return (
    <>
      <nav className="navbar navbar-expand-lg bg-body-tertiary">
        <div className="container-fluid">
          <a className="navbar-brand" href="#">Navbar</a>
          <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarText">
            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
              <li className="nav-item">
                <a className="nav-link active" aria-current="page" href="/FileUploadScreen">Upload File</a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/ManualMovementRegisterScreen">Manual Movement Register</a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/PieReportScreen">Pie Report</a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/BalancesScreen">Balances</a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/CardListScreen">Card Report</a>
              </li>
              <li className="nav-item">
                <a className="nav-link" href="/FamiliesScreen">Family CRUD</a>
              </li>
            </ul>
            <span className="navbar-text">
              Navbar text
            </span>
          </div>
        </div>
      </nav>
      <div id="screen">
        <Routes>
          <Route path="/FileUploadScreen" element={ <FileUploadScreen /> } />
          <Route path="/PieReportScreen" element={ <PieReportScreen /> } />
          <Route path="/ManualMovementRegisterScreen" element={ <ManualMovementRegisterScreen /> } />
          <Route path="/BalancesScreen" element= { <BalancesScreen /> } />
          <Route path="/CardListScreen" element= { <CardListScreen /> } />
          <Route path="/FamiliesScreen" element= { <FamiliesScreen /> } />
        </Routes>
      </div>
    </>
  )
}

export default App
