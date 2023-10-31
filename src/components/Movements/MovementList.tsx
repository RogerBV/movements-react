import { useState, useEffect } from "react";
import { yearList, monthList } from "../../Utils";
import { getMovementsByMonth, getCards } from ".";
import Card from "../../entities/Card";

function MovementList() {
    const [movements, setMovements] = useState([]);
    const [selectedCard, setSelectedCard] = useState<string>('1');
    const [selectedYear, setSelectedYear] = useState<string>('2023');
    const [selectedMonth, setSelectedMonth] = useState<string>('1');
    const [income, setIncome] = useState<number>(0);
    const [expense, setExpense] = useState<number>(0);
    const [totalMovement, setTotalMovement] = useState<number>(0);
    const [cardList, setCardList] = useState<Card[]>([]);
    const fetchCards = async () => {
      const result = await getCards();
      setCardList(result);
    }

    const getMovementList = async() => {
        setMovements([]);

        const movementList = await getMovementsByMonth(selectedYear, selectedMonth, selectedCard);
        setIncome(0);
        setExpense(0);
        
        let incomeTemp = 0;
        let expenseTemp = 0;

        movementList.map((movement: any) => {
            incomeTemp = incomeTemp + movement.income;
            expenseTemp = expenseTemp + movement.expense;  
        })
        
        setTotalMovement(incomeTemp - expenseTemp);
        setIncome(incomeTemp) ;
        setExpense(expenseTemp);
        setMovements(movementList);
    }

    useEffect(() => { fetchCards() }, []);

    return (
        <>
            <div className="mb-3">
                <div className="row">
                    <div className="col-4">
                        <select className="form-select" id="cboCard" name="cboCard" value={selectedCard} onChange={e => { setSelectedCard(e.target.value); }} >
                            {
                                cardList.map((element: Card) => {
                                    return (
                                      <option key={element.cardId} value={element.cardId}>Tarjeta {element.financialEntityName} {element.cardTypeName} {element.currencyTypeName}</option>
                                    )
                                })
                            }
                        </select>
                    </div>
                    <div className="col-3">
                        <select className="form-select" id="cboYear" name="cboYear" value={selectedYear} onChange={e => {setSelectedYear(e.target.value); }} >
                            {
                                yearList.map((year) => {
                                    return (
                                        <option key={year.year} value={year.year}>{year.year}</option>
                                    )
                                })
                            }
                        </select>
                    </div>
                    <div className="col-3">
                        <select className="form-select" id="cboMonth" name="cboMonth" value={selectedMonth} onChange={e => { setSelectedMonth(e.target.value) } }>
                            {
                                monthList.map((month) => {
                                    return (
                                        <option key={month.monthId} value={month.monthId}>{month.monthName}</option>
                                    )
                                })
                            }
                        </select>
                    </div>
                    <div className="col-2">
                        <button id="btnConsult" name="btnConsult" className="btn btn-primary" onClick={() => getMovementList() }  >Consult</button>
                    </div>
                </div>
            </div>
            <div className="mb-3">
                <div className="row">
                    <label className="label">
                        
                    </label>
                </div>
            </div>
            <div className="mb-3">
                <div className="row">
                    <label className="label">
                        Total Income: {income}, Total Expense: {expense} Total Movement: {totalMovement}
                    </label>
                </div>
            </div>
            
            <table className="table table-striped">
                <tbody>
                    <tr>
                        <th>Date</th>
                        <th>Concept</th>
                        <th>Income</th>
                        <th>Expense</th>
                    </tr>
                    {
                        movements.map((element: any) => {
                            return (
                                <tr key={element.movementId}>
                                    <td>{element.dateValue.substring(0,10)}</td>
                                    <td>{element.concept}</td>
                                    <td>{element.income}</td>
                                    <td>{element.expense}</td>
                                </tr>
                            )
                        })
                    }    
                </tbody>
            </table>
        </>
    )
}

export default MovementList