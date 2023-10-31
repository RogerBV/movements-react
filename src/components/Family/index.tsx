import { getJsonFromGet, getJsonFromPost } from "../Request";

export const fetchFamilies = async () => {
    const objParams = {

    }

    const result = await getJsonFromGet('getFamilies', objParams);
    return result
}

export const inserFamily = async (familyName: string) => {
    const objParams = {
      familyName: familyName
    }

    await getJsonFromPost('insertFamily', objParams)
}

export const fetchFamilyConceptByFamilyId = async (FamilyId: string) => {
  const objParams = {
    FamilyId: FamilyId
  }

  const result = await getJsonFromGet('getFamilyConceptByFamilyId', objParams);
  return result;
}

export const insertFamilyConcept = async (name: string, familyId: string) => {
  const objParams = {
    Name: name,
    FamilyId: familyId
  }
  console.log(objParams);
  const result = await getJsonFromPost('insertFamilyConcept', objParams);
  return result;
}