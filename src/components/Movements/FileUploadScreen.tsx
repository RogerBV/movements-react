import { useState, useEffect } from "react";
import Card from "../../entities/Card";
import axios from 'axios';
import { getCards } from ".";

function FileUploadScreen() {
  const [selectedCard, setSelectedCard] = useState(1);
  const [cardList, setCardList] = useState<Card[]>([]);
  const [selectedFile, setSelectedFile] = useState<File | null>(null);;
  const fetchCards = async () => {
    const result = await getCards();
    setCardList(result);
  }

  useEffect(() => {fetchCards()}, []);

    const uploadFile = () => {
        uploadFileReport();
    }

    const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
      const file = e.target.files?.[0];
      if (file) {
        setSelectedFile(file);
      }
    };

    const uploadFileReport = async () => {
      
      try {
        const formData = new FormData();
        formData.append('file', selectedFile);
        formData.append('cardId', selectedCard);
        const response = await axios.post('http://localhost:3000/api/uploadBCPDebitCard', formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        });
        if (response.status === 200) {
          alert('Successful Upload.');
        }
      } catch (error) {
        console.error('Error al subir el archivo:', error);
      }
    };
    
    return (
        <div className="container">
            <div className="mb-3">
                <div className="row">
                    <div className="col-1">
                        <label className="form-label">Card Type</label>
                    </div>
                    <div className="col-3">
                        <select id="cboCardType" name="cboCardType" className="form-select" value={selectedCard} onChange={e => setSelectedCard(Number(e.target.value))}>
                            {
                                cardList.map((element: Card) => {
                                    return (
                                        <option key={element.cardId} value={element.cardId}>Tarjeta {element.financialEntityName} {element.cardTypeName} {element.currencyTypeName}</option>
                                    )
                                })
                            }
                        </select>
                    </div>
                </div>
            </div>
            <div className="mb-3">
                <div className="row">
                    <div className="col-1">
                        <label className="form-label">Archivo</label>
                    </div>
                    <div className="col-4">
                        <input type="file" className="form-control form-control-file" onChange={e =>  handleFileChange(e)} />
                    </div>
                </div>
            </div>
            <div className="mb-3">
                <div className="row">
                    <div className="col-1"></div>
                    <div className="col-3">
                        <button type="button" className="btn btn-primary" onClick={uploadFile} >Upload</button>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default FileUploadScreen