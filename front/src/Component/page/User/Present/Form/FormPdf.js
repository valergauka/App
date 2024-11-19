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

  // Додаємо перевірку на існування об'єкта props.orders
  const orderTitle = props.orders?.title || 'Назва відсутня';

  const handleFileChange = (files) => {
    const maxSize = 10 * 1024 * 1024; // 10 MB (змініть розмір за потреби)
    const invalidFiles = files.filter(file => file.size > maxSize);

    if (invalidFiles.length > 0) {
      console.error('Наступні файли завеликі:');
      invalidFiles.forEach(file => console.error(file.name));
      setSelectedFiles([]);
    } else {
      const uniqueFiles = files.filter(file => !selectedFiles.some(selectedFile => selectedFile.name === file.name));
      setSelectedFiles(prevSelectedFiles => [...prevSelectedFiles, ...uniqueFiles]);
    }
  };

  const uploadFiles = async () => {
    if (selectedFiles && selectedFiles.length > 0) {
      const formData = {
        files: selectedFiles,
        reviewId: reviewId,
      };

      try {
        const response = await axios.post(`${NET.APP_URL}/upload-files`, formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        });

        if (response.status === 200) {
          console.log(response.data);
          window.location.reload();
        } else {
          console.error('Error uploading files:', response.statusText);
        }
      } catch (error) {
        console.error('Error uploading files:', error);
      }
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
          <h3>{orderTitle}</h3>
        </div>
        <form className='form'>
          <div className='textINPUT'>
            <b>Додайте наступні файли:</b>
            <ul>
              {props.categories && props.categories.length > 0 ? (
                props.categories.map(el => (
                  <li key={el.id}>
                    <p>{el.titule}</p>
                  </li>
                ))
              ) : (
                <li>Категорії відсутні</li>  // Показуємо повідомлення, якщо категорії відсутні
              )}
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
