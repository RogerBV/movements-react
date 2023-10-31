import { useState } from "react";
import RegisterMovementScreen from "./RegisterMovementScreen";
import MovementList from "./MovementList";

function ManualMovementRegisterScreen() {
  
    const [year, setYear] = useState(0)
    const [month, setMonth] = useState(0)
    const [cardId, setCardId] = useState(0);

    const registerMovement = () => {
        console.log('Movimiento Registrado!');
    }

    const onDateChange = (value: string) => {
        var date = new Date(value);
        setYear(date.getFullYear());
        setMonth(date.getMonth()+1);
    }

    return (
        <div className="container">
            <div className="row">
                <div className="col-6">
                    <RegisterMovementScreen onDateChange={onDateChange} onRegisterMovement={registerMovement} />    
                </div>
                <div className="col-6">
                    <MovementList />
                </div>
            </div>
            
            
        </div>
    );
}

export default ManualMovementRegisterScreen