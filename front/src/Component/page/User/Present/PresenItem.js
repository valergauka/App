import React, { Component, useState } from 'react';
import Button from '../../../UIComponent/Button';

import './Present.css';

const PresentItem = (props) => {

  const OpenForm = (category) => {
    // console.log(title);
    props.FormOpen();
    props.category(category)
  }

  return (
    <div onClick={() => OpenForm(props.button)} className='buttoncomentFormLink'>
      <Button title={props.button.title} />
    </div>




  )
}

export default PresentItem