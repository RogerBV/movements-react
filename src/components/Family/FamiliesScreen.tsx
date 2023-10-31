import { useState, useEffect } from "react";
import FamilyListScreen from "./FamilyListScreen";
import SaveFamilyScreen from "./SaveFamilyScreen";
import { fetchFamilies } from ".";

const FamiliesScreen = () => {
  const [families, setFamilies] = useState([]);
  
  useEffect(() => {
    getFamilies();
  }, [])

  const getFamilies = async () => {
    const result = await fetchFamilies();
    setFamilies(result);
  }

  return (
    <div className="containter">
      <div className="row">
        <div className="col-5">
         <SaveFamilyScreen familyList={getFamilies} />
        </div>
        <div className="col-7">
          <FamilyListScreen families={families} />
        </div>
      </div>
    </div>
  )
}

export default FamiliesScreen;