import { useState } from "react";
import FamilyConceptModal from "./FamilyConceptModal";
import { fetchFamilyConceptByFamilyId } from ".";

interface FamiliesScreenProps {
    families: any[];
}

const FamiliesScreen = ({ families }: FamiliesScreenProps) => {
  const [modalOpen, setModalOpen] = useState(false);
  const [familyConcepts, setFamilyConcept] = useState([]);
  const [familyId, setFamilyId] = useState('');
  const modalFamilyConcept = (familyCode: string) => {
    setModalOpen(true);
    getFamilyConceptByFamilyId(familyCode);
  }

  const closeModal = () => {
    setModalOpen(false);
  }

  const getFamilyConceptByFamilyId = async (FamilyId: string) => {
    const result = await fetchFamilyConceptByFamilyId(FamilyId);
    setFamilyConcept(result);
    setFamilyId(FamilyId);
  }

  return (
    <div>
      <FamilyConceptModal modalOpen={modalOpen} onCloseModal={closeModal} familyId={familyId} familyConcepts={familyConcepts} listFamilyConcepts={getFamilyConceptByFamilyId} />
      
    <table className="table table-striped">
      <tbody>
        <tr key={0}>
          <th>FamilyId</th>
          <th>Name</th>    
        </tr>
        {
          families.map((family: any) => {
            return (
              <tr key={family.FamilyId}>
                <td>{family.FamilyId}</td>
                <td><a href="#" onClick={() => {modalFamilyConcept(family.FamilyId)}}>{family.Name}</a></td>
              </tr>
            )
          })
        }
      </tbody>
    </table>
    </div>
  )
}

export default FamiliesScreen;