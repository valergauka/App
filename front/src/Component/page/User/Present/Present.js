import React, { useState } from 'react';
import PresentItem from './PresenItem';
import Header from '../../../UIComponent/Header';
import FormLb from './Form/FormLb';
import './Present.css';

const Present = (props) => {
  const [category, setCategory] = useState([]);
  const [openPresent, setOpenPresent] = useState(true);
  const [opentForm, setOpentForm] = useState(false);
  const [reviewData, setReviewData] = useState(null); // Для збереження даних відгуку

  // Функція для обробки отриманих даних
  const handleReviewId = (data) => {
    setReviewData(data);
    console.log('Отримані дані відгуку:', data); // Логування даних
  }

  const FormOpen = (title) => {
    setOpenPresent(false);
    setOpentForm(true);
    setCategory(title);
  }

  const CloseForm = () => {
    setOpenPresent(true);
    setOpentForm(false);
  }

  return (
    <div>
      {openPresent && (
        <div>
          <Header />
          <main className='buttons'>
            {props.buttons.map(but => (
              <PresentItem
                FormOpen={FormOpen}
                category={setCategory}
                key={but.id}
                button={but}
                onAdd={props.onAdd}
              />
            ))}
          </main>
        </div>
      )}
      {opentForm && (
        <FormLb
          CloseForm={CloseForm}
          orders={category}
          categories={props.categoriesPdf}
          reviewId={handleReviewId} // Передаємо функцію reviewId
        />
      )}

    </div>
  );
}

export default Present;
