import React, { useState } from 'react';
import Button from '../../../../UIComponent/Button';
import axios from 'axios';
import Upload from './upload/Upload';
import NET from '../../../../../network';

import './FormPdf.css';
import './Form.css';

export default function FormPdf(props) {
  const reviewId = props.reviewId;
  const [selectedFiles, setSelectedFiles] = useState([]);

  const handleFileChange = (files) => {
    const maxSize = 10 * 1024 * 1024; // 10 MB (змініть розмір за потреби)
    const invalidFiles = files.filter(file => file.size > maxSize);

    if (invalidFiles.length > 0) {
      // Якщо є невідповідні файли, виводимо повідомлення
      console.error('Наступні файли завеликі:');
      invalidFiles.forEach(file => console.error(file.name));
      // Очищаємо вибрані файли
      setSelectedFiles([]);
    } else {
      // Якщо всі файли валідні, додаємо їх до вибраних
      const uniqueFiles = files.filter(file => !selectedFiles.some(selectedFile => selectedFile.name === file.name));
      setSelectedFiles(prevSelectedFiles => [...prevSelectedFiles, ...uniqueFiles]);
    }
  };


  const uploadFiles = async () => {
    if (selectedFiles && selectedFiles.length > 0) {
      //for (let i = 0; i < selectedFiles.length; i++) {
        const formData = {
          files: selectedFiles,
          reviewId: reviewId,
        }
        
        try {
          const response = await axios.post(`${NET.APP_URL}/upload-files`, formData, {
            headers: {
              'Content-Type': 'multipart/form-data',
            },
          });

          if (response.status === 200) {
            console.log(response.data); // Отримання індексів збережених файлів
            window.location.reload();
          } else {
            console.error('Error uploading files:', response.statusText);
          }
        } catch (error) {
          console.error('Error uploading files:', error);
        }
     // }
    } else {
      console.error('No files to upload.');
    }
  };




  const handleDelete = (name) => {
    setSelectedFiles(selectedFiles.filter(file => file.name !== name));
  };

  return (
    <div>
      <main className='mainForm'>
        <div className='titleForm'>
          <h3>{props.orders.title}</h3>
        </div>
        <form className='form'>
          <div className='textINPUT'>
            <b>Додайте наступні файли:</b>
            <ul>
              {props.categories.map(el => (<li><p>{el.titule}</p></li>))}
            </ul>
          </div>
          <Upload handleFileChange={handleFileChange} />
        </form>
        <div className='failINPUT'>
          <b>Назва файлів, які ви додали:</b>
          <div className='outputNameFile'>
            {selectedFiles.map((file, index) => (
              <div key={index} className='fileItem'>
                <p className='fileItemName'>Ім'я файлу: {file.name}</p>
                <p onClick={() => handleDelete(file.name)} className='deleteInputPDF'>Видалити</p>
              </div>
            ))}
          </div>
        </div>
        <div className='formButton' onClick={uploadFiles}>
          <Button title='Подати' />
        </div>
      </main>
    </div>
  );
}
