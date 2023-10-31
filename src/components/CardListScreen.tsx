import { useState, useEffect } from 'react';
import { getJsonFromGet } from './Request';
import Card from "../entities/Card";

function CardList() {
  const [cardList, setCardList] = useState([]);

  const getCards = async () => {
    const objParams = {

    }
    const result = await getJsonFromGet('getCards', objParams);
    setCardList(result);
  };

  useEffect(()=> {getCards()}, []);

  return (
    <>
      <table className="table table-striped">
        <tbody>
            <tr>
                <th>
                  Card ID
                </th>
                <th>
                    Card Number
                </th>
                <th>
                    Currency Type
                </th>
                <th>
                    Card Type
                </th>
            </tr>
            {
                cardList.map((card: Card) => {
                  return (
                    <tr key={card.cardId}>
                        <td>{card.cardId}</td>
                        <td>{card.cardNumber}</td>
                        <td>{card.currencyTypeName}</td>
                        <td>{card.cardTypeName}</td>
                        <td>{card.financialEntityName}</td>
                    </tr>
                  )
                })
            }
        </tbody>
      </table>
    </>
  )
}

export default CardList