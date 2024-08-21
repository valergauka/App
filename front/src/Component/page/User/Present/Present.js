import React, { useState } from 'react';
import PresentItem from './PresenItem';
import Header from '../../../UIComponent/Header';
import FormLb from './Form/FormLb';
import './Present.css';
import FormPdf from './Form/FormPdf';

const Present = (props) => {
  const [category, setCategory] = useState([]);
  const [openPresent, setOpenPresent] = useState(true);
  const [opentForm, setOpentForm] = useState(false);
  const [opentFormPDF, setOpentFormPDF] = useState(false);
  const [reviewId, setReviewId] = useState('');
  const [formDataReviewNew, setFormDataReviewNew] = useState({});
  const FormOpen = (title) => {
    setOpenPresent(false);
    setOpentForm(true);
    setCategory(title)

  }


  const CloseForm = () => {
    setOpenPresent(true);
    setOpentForm(false);

  }

  const FormOpenPDF = () => {
    setOpentForm(false);
    setOpentFormPDF(true);
  }

  return (
    <div>
      {
        openPresent &&
        <div>
          <Header />
          <main className='buttons'>
            {props.buttons.map(but => (
              <PresentItem FormOpen={FormOpen} category={setCategory}  key={but.id} button={but} onAdd={props.onAdd} />
            ))}
          </main>
        </div>
      }
      {
        opentForm && 
        <FormLb reviewId={setReviewId} setFormData={setFormDataReviewNew}  CloseForm={CloseForm} OpenFormPdf={FormOpenPDF} orders={category} categories={props.categoriesPdf} />

      }

      {
        opentFormPDF && 
        <FormPdf reviewId={reviewId} orders={category} newReview={formDataReviewNew} FormOpen={FormOpenPDF} categories={props.categories} />

      }
      </div>

  )

}

export default Present;
