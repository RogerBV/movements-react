import Movement from "../../entities/Movement";
import { getJsonFromGet, getJsonFromPost } from "../Request";

export const getMovementsByMonth = async (yearId: string, monthId: string, cardId: string) => {
    const objParams = {
      yearId: yearId,
      monthId: monthId,
      cardId: cardId
    }
    
    const movementList = await getJsonFromGet('getMovementsByMonth', objParams);
    return movementList;
}

export const manualRegisterMovement = async (movement: Movement | any) => {
  const objParams = {
    movement: JSON.stringify(movement)
  }

  const registeredMovement = await getJsonFromPost('manualRegisterMovement', objParams);
  return registeredMovement;
}

export const getSumedMovementsByMonthAndConcept = async (cardId: number, yearId: string, monthId: string) => {
  const objParams = {
    cardId: cardId,
    yearId: yearId,
    monthId: monthId,
    dayId: 0
  }
  const report = await getJsonFromGet('getSumedMovementsByMonthAndConcept', objParams);
  return report;
};

export const getCards = async () => {
  const objParams = {

  }
  return await getJsonFromGet('getCards', objParams)
}