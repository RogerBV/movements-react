import { useState, useEffect } from "react";
import { yearList, monthList } from "../Utils"
import Card from "../entities/Card";
import { getCards } from "./Movements";

interface SearchBarProps {
    getInformation: (cardId:number, yeardId: number, monthId: number) => void;
}

function SearchBar ({ getInformation }: SearchBarProps) {

   const getInformationByMonth = () => {
     getInformation(selectedCard, selectedYear, selectedMonth);
   };

   const [selectedCard, setSelectedCard] = useState(1);
   const [selectedYear, setSelectedYear] = useState(2023);
   const [selectedMonth, setSelectedMonth] = useState(1);
   const [cardList, setCardList] = useState<Card[]>([]);

   const fetchCards = async () => {
     const result = await getCards();
     setCardList(result);
   }

   useEffect(() => { fetchCards() }, []);

    return (
        <div className="row">
            <div className="col-1">
                <label>Card</label>
            </div>
            <div className="col-3">
                <select className="form-select" value={selectedCard} onChange={(e) => setSelectedCard(Number(e.target.value))}>
                    {
                        cardList.map((element: Card) => {
                            return (
                              <option key={element.cardId} value={element.cardId}>Tarjeta {element.financialEntityName} {element.cardTypeName} {element.currencyTypeName}</option>
                            )
                        })
                    }
                </select>
            </div>
            <div className="col-2">
                <select id="cboYear" name="cboYear" className="form-select" value={selectedYear} onChange={(e) => setSelectedYear(Number(e.target.value)) }>
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
                <select id="cboMonth" name="cboMonth" className="form-select" value={selectedMonth} onChange={(e) => setSelectedMonth(Number(e.target.value))}>
                    {
                        monthList.map((month) => {
                            return (
                                <option key={month.monthId} value={month.monthId} >{month.monthName}</option>
                            )
                        })
                    }
                </select>
            </div>
            <div className="col-1">
              <button id="btnRequest" name="btnRequest" className="btn btn-primary" onClick={() => getInformationByMonth()} >Request</button>
            </div>
        </div>
    )
}

export default SearchBar