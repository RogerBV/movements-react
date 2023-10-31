import { manualRegisterMovement, getCards } from ".";
import Movement from "../../entities/Movement";
import { movementTypeList } from "../../Utils"
import { useState, useEffect } from 'react';
import Card from "../../entities/Card";

interface Props {
    onDateChange: (value: string) => void,
    onRegisterMovement: () => void,
}

function RegisterMovementScreen({ onDateChange, onRegisterMovement }: Props) {
    const [concept, setConcept] = useState("");
    const [amount, setAmount] = useState(0);
    const [selectedDate, setSelectedDate] = useState<string>('');
    const [selectedCard, setSelectedCard] = useState<string>('0');
    const [selectMovementType, setSelectedMovementType] = useState<number>(2);
    const [cardList, setCardList] = useState<Card[]>([]);
    const fetchCards = async () => {
        const result = await getCards();
        setCardList(result);
    }

    const handleDateChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setSelectedDate(event.target.value);
        onDateChange(event.target.value);
    };

    const validateForm = (): Boolean => {
        if(Number(selectedCard) === 0) {
            alert('You should select a Card');
            return false;
        }
        else if(selectedDate.trim().length === 0){
            alert('You should select a date');
            return false;
        }
        else if(concept.trim().length === 0){
            alert('Concept field can not be empty');
            return false;
        }
        else if(amount === 0){
            alert('Amount field can not be 0');
            return false;
        }
        
        return true;
    }

    const registerMovement = async () => {
        let movement;
        if(validateForm() == true) {
            if(selectMovementType == 1) {
                movement = new Movement(selectedDate, selectedDate, concept, 0, amount, Number(selectedCard));
            } else if (selectMovementType == 2) {
                movement = new Movement(selectedDate, selectedDate, concept, amount, 0, Number(selectedCard));
            }
    
            const registeredMovement = manualRegisterMovement(movement);
            
            setSelectedCard('0');
            setConcept('');
            setAmount(0);

            console.log( JSON.stringify(registeredMovement) );
        }
    }

    useEffect(() => { fetchCards() }, []);

    return (
        <>
            <div className="mb-3"></div>
                <div className="mb-3">
                    <div className="row">
                        <div className="col-3">
                            <label>Card</label>
                        </div>
                        <div className="col-4">
                            <select className="form-select" id="cboCard" name="cboCard" value={selectedCard} onChange={e => { setSelectedCard(e.target.value);  }  }>
                                {
                                    cardList.map((element: Card) => {
                                        return (
                                          <option key={element.cardId} value={element.cardId}>Tarjeta {element.financialEntityName} {element.cardTypeName} {element.currencyTypeName}</option>
                                        )
                                    })
                                }
                            </select>
                        </div>
                    </div>
                </div>
                <div className="mb-3">
                    <div className="row">
                        <div className="col-3">
                            <label>Date</label>
                        </div>
                        <div className="col-4">
                            <input type="date" className="form-control" id="txtMovementDate" name="txtMovementDate" value={selectedDate} onChange={handleDateChange}  />
                        </div>
                    </div>
                </div>
                <div className="mb-3">
                    <div className="row">
                        <div className="col-3">
                            <label>Movement Type</label>
                        </div>
                        <div className="col-4">
                            <select className="form-select" id="cboMovementType" name="cboMovementType" value={selectMovementType} onChange={e => setSelectedMovementType( Number(e.target.value) )}>
                                {
                                    movementTypeList.map((movementType) => {
                                        return (
                                            <option key={movementType.movementTypeId} value={movementType.movementTypeId} >{movementType.movementTypeName}</option>
                                        )
                                    })
                                }
                            </select>
                        </div>
                    </div>
                </div>
                <div className="mb-3">
                    <div className="row">
                        <div className="col-3">
                            <label>Concept</label>
                        </div>
                        <div className="col-4">
                            <input type="text" className="form-control" value={concept} onChange={e => setConcept(e.target.value)} />
                        </div>
                    </div>
                </div>
                <div className="mb-3">
                    <div className="row">
                        <div className="col-3">
                            <label>Amount</label>
                        </div>
                        <div className="col-4">
                            <input type="number" className="form-control" id="txtAmount" name="txtAmount" value={amount} onChange={e => setAmount(  Number(e.target.value) ) } />
                        </div>
                    </div>
                </div>
                <div className="mb-3">
                    <div className="row">
                        <div className="col-3"></div>
                        <div className="col-3">
                            <input type="button" className="btn btn-primary" value="Register Movement" onClick={() => registerMovement()} />
                        </div>
                    </div>
                </div>
        </>
    )
}

export default RegisterMovementScreen