import { useState, useEffect } from "react";
import { cardList } from "../Utils";
import { getJsonFromGet } from './Request';

function BalancesScreen() {
    const [balances, setBalances] = useState([]);
    const [selectedCard, setSelectedCard] = useState<number>(0);

    const getBalancesByCardId = async() => {
        const objParams = {
            cardId: selectedCard
        }

        const balanceList = await getJsonFromGet('getBalances', objParams);
        setBalances(balanceList);
    }

    return (
        <>
            <div className="row">
                <div className="col-3">
                    <select id="cboCard" name="cboCard" className="form-select" value={selectedCard} onChange={e => {setSelectedCard( Number(e.target.value) )}}>
                        {
                            cardList.map((card) => {
                                return (
                                    <option key={card.cardId} value={card.cardId}>{card.cardName}</option>
                                )
                            })
                        }
                    </select>
                </div>
                <div className="col-1">
                    <button className="btn btn-primary" onClick={() => {getBalancesByCardId()}}>Consult</button>
                </div>
            </div>
            <table className="table">
                  
                <tbody>
                    <tr>
                        <th>Period</th>
                        <th>Total Incomes</th>
                        <th>Total Expenses</th>
                        <th>Total Movement</th>
                        <th>Balance</th>
                    </tr>
                    {
                        balances.map((balance: any) => {
                            return (
                                <tr key={balance.balanceId}>
                                    <td>{balance.yearId} - {balance.monthId}</td>
                                    <td>{balance.totalIncome}</td>
                                    <td>{balance.totalExpense}</td>
                                    <td>{balance.totalMovement}</td>
                                    <td>{balance.totalBalance}</td>
                                </tr>
                            )
                        })
                    }
                </tbody>
            </table>
        </>
    )
}

export default BalancesScreen