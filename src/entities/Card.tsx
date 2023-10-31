class Card {
  cardId: string = "";
  cardNumber: string  = "";
  currencyTypeName: string = "";
  financialEntityName: string = "";
  cardTypeName: string = "";

  getName () {
    return 'Tarjeta ' +  this.financialEntityName + ' ' + this.cardTypeName + ' ' + this.currencyTypeName 
  }

  getCurrencyTypeName() {
    return this.currencyTypeName;
  }
}

export default Card