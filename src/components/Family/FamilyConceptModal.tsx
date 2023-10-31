import { useState } from 'react';
import Modal from 'react-modal';
import { insertFamilyConcept } from './index';

const customStyles = {
  content: {
    top: '50%',
    left: '50%',
    right: 'auto',
    bottom: 'auto',
    marginRight: '-50%',
    transform: 'translate(-50%, -50%)',
  },
};

interface FamilyConceptModalProps {
  modalOpen: boolean;
  onCloseModal: () => void;
  familyId: string;
  familyConcepts: any[];
  listFamilyConcepts: (FamilyId: string) => void;
}

const FamilyConceptModal = ({ modalOpen, onCloseModal, familyId, familyConcepts, listFamilyConcepts }: FamilyConceptModalProps) => {
    const [familyConceptName, setFamilyConceptName] = useState('');
    let subtitle;
  
    function afterOpenModal() {
      // references are now sync'd and can be accessed.
      subtitle.style.color = '#f00';
    }

    const registerFamilyConcept = () => {
      insertFamilyConcept(familyConceptName, familyId);
      setFamilyConceptName('');
      listFamilyConcepts(familyId);
    }
  
    return (
      <div>
        <Modal
          isOpen={modalOpen}
          onAfterOpen={afterOpenModal}
          onRequestClose={onCloseModal}
          style={customStyles}
          contentLabel="Example Modal"
          appElement={document.getElementById('app')}
        >

          <div className='row'>
            <div className='col-10'>
              <h2 ref={(_subtitle) => (subtitle = _subtitle)}>Detail</h2>
            </div>
            <div className='col-2'>
              <button onClick={onCloseModal}>close</button>
            </div>
          </div>
          
          
          <div className='row'>
            <div className='col-6'>
              <input type="text" className='form-control' placeholder='Concept Name' value={familyConceptName} onChange={(e) => {setFamilyConceptName(e.target.value)}} />
            </div>
            <div className='col-2'>
              <input type='button' className='btn btn-primary' value='Save' onClick={registerFamilyConcept}></input>
            </div>
            <div className='col-3'>
              <table className="table table-striped">
                <tbody>
                  <tr>
                    <th>Concept</th>
                  </tr>
                  {
                    familyConcepts.map((familyConcept: any) => {
                      return (
                        <tr key={familyConcept.FamilyConceptId}>{familyConcept.Name}</tr>
                      )
                    })
                  }
                </tbody>
              </table>
            </div>
          </div>
        </Modal>
      </div>
    );
};

export default FamilyConceptModal;