import SearchBar from "../SearchBar"
import { useState } from 'react';
import { Pie } from 'react-chartjs-2';
import { 
    Chart as ChartJS,
    ArcElement,
    Tooltip,
    Legend
 } from 'chart.js';
import { getSumedMovementsByMonthAndConcept } from ".";

ChartJS.register(
    ArcElement,
    Tooltip,
    Legend
)

function PieReportScreen() {
    const [reportData, setReportData] = useState({})

    const options = {

    };

    const formatData = (info: []) => {
      let conceptList:any[] = [];
      let expenseList: any[] = [];
      if (info != undefined) {
        info?.map((element: any) => {
          conceptList.push(element.concept);
          expenseList.push(element.expense);
        });
      }

      const report = {
        labels: conceptList,
        datasets: [
        {
          label: 'Expenses Report',
          data: expenseList,
          backgroundColor: ['#41B883', '#E46651', '#00D8FF', '#DD1B16',
            'rgb(255, 205, 86)', '#FF00FF', '#066A5E', '#000407',
            '#606F79', '#32FA04', '#00D8FF', '#DD1B16']
        }
       ]
      }
      setReportData(report);
    }

    const getPieReport = async (cardId: number, yearId: string, monthId: string) => {
      const report = await getSumedMovementsByMonthAndConcept(cardId, yearId, monthId);
      formatData(report);
    }

    return (
        <div>
            <SearchBar getInformation={getPieReport} />
            { reportData.datasets && <Pie data={reportData} options={options} /> }
        </div>
    )
}

export default PieReportScreen