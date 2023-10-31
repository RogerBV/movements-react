import { useState } from "react";
import { inserFamily } from ".";

interface SaveFamilyScreenProps {
  familyList: () => void;
}

const SaveFamilyScreen = ({ familyList }: SaveFamilyScreenProps) => {
  const [familyName, setFamilyName] = useState('');

  const SaveFamily = async () => {
    await inserFamily(familyName);
    familyList();
    setFamilyName('');
  }

  return (
    <div className="row">
        <div className="col-4">
          <input type="text" className="form-control" placeholder="Family's Name" value={familyName} onChange={(e) => setFamilyName(e.target.value)}/>
        </div>
        <div className="col-1">
          <input type="button" className="btn btn-primary" value="Save" onClick={() => SaveFamily()} />
        </div>
    </div>
  )
}

export default SaveFamilyScreen;