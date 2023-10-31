class Movement {
    
    dateMovement: string = "";
    dateValue: string = "";
    concept: string = "";
    expense: number = 0;
    income: number = 0;
    cardId: number = 0;

    constructor(dateMovement: string, dateValue: string, concept: string, expense: number, income: number, cardId: number) {
        this.dateMovement = dateMovement;
        this.dateValue = dateValue;
        this.concept = concept;
        this.expense = expense;
        this.income = income;
        this.cardId = cardId;
    }
}

export default Movement