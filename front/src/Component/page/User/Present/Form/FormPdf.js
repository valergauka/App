import React, {useState} from 'react';
import Button from '../../../../UIComponent/Button';
import axios from 'axios';


import './FormPdf.css';
import './Form.css';
import CategoriesPdf from './CategoriesPdf';
import { Link } from 'react-router-dom';
export default function FormPdf(props) {
  const [files, setFiles] = useState([]);

  const handleFileChange = (event, index,) => {
    const selectedFile = event.target.files[0];
    const newFiles = [...files];
    newFiles[index] = selectedFile;
    setFiles(newFiles);
  };

  const handleUpload = () => {
    const formData = new FormData();

    files.forEach((file, index) => {
      formData.append(`file${index}`, file);
    });
    formData.append('idReview',2);
    console.log(formData)
    axios.post('/upload', formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
    .then(response => {
      console.log(response);
      // Додаткові дії після успішного завантаження файлів
    })
    .catch(error => {
      console.log(error);
      // Обробка помилки завантаження файлів
    });
  };

  return (
    <div>
      <main className='mainForm'>
        <div className='titleForm'>
          {props.orders.map(el => (<h3>{el.title}</h3>))}
        </div>
        <form className='form'>
          {props.categories.map(el => (<CategoriesPdf handleFileChange={handleFileChange}  key={el.id} category={el} />))}
        </form>
        <div className='formButton' onClick={handleUpload}>
          <Link to={'/present'}>
            <Button title='Подати' />
          </Link>

        </div>
      </main>
    </div>

  )
}
