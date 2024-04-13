import { Routes, Route, Link } from "react-router-dom"
import FileUploadScreen from '../components/Movements/FileUploadScreen'
import PieReportScreen from '../components/Movements/PieReportScreen'
import ManualMovementRegisterScreen from '../components/Movements/ManualMovementRegisterScreen'
import BalancesScreen from '../components/BalancesScreen'
import CardListScreen from '../components/CardListScreen'
import FamiliesScreen from '../components/Family/FamiliesScreen'
import { Button, Container, Nav, NavDropdown, Navbar } from "react-bootstrap"

interface MenuProps {
    updateLoggedUser: (val: string) => void
  }

export const Menu = ({ updateLoggedUser }: MenuProps) => {
    const logOut = () => {
        localStorage.clear();
        updateLoggedUser('');
    }
  return (
    <>
      <Navbar expand="lg" className="bg-body-tertiary">
        <Container>
          <Navbar.Collapse>
            <Nav className="me-auto">
              <Nav.Link href="#home">Home</Nav.Link>
              <Nav.Link href="#link">Link</Nav.Link>
              <NavDropdown title="Movements" id="basic-nav-dropdown">
                <Link to="/FileUploadScreen" className="nav-link" aria-current="page">Upload File</Link>
                <Link to="/ManualMovementRegisterScreen" className="nav-link" aria-current="page">Manual Movement Register</Link>
              </NavDropdown>
              <NavDropdown title="Reports" id="basic-nav-dropdownReports">
                <Link to="/PieReportScreen" className="nav-link" aria-current="page">Pie Report</Link>
              </NavDropdown>
              <Link to="/BalancesScreen" className="nav-link" aria-current="page">Balances</Link>
              <Link to="/CardListScreen" className="nav-link" aria-current="page">Card Report</Link>
              <Link to="/FamiliesScreen" className="nav-link" aria-current="page">Family CRUD</Link>
            </Nav>
          </Navbar.Collapse>
          <Navbar.Collapse className="justify-content-end">
            <Button variant="primary" onClick={() => logOut()} >Log Out</Button>
            <Navbar.Text>
              {localStorage.getItem("email")}
            </Navbar.Text>
          </Navbar.Collapse>
        </Container>
      </Navbar>
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

export default Menu
