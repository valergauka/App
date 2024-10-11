import React, { useState } from 'react';

import './ReviewItems.css';

const ReviewItems = (props) => {
  const OpenCart = () => {
    props.openCart(props.review);
    props.OpentReview();
  }


    return (
      <div className={'category'} onClick={OpenCart}>
        <div className={'link1'}>
          <h3 className='titleReview'>{props.review.category.title}</h3>
          <h5>{props.review.educLevel}</h5>
          <h5>{props.review.nameOp}</h5>
          <p>{props.review.speciality}</p>
          <p>{props.review.faculty}</p>
          <p className='date'>{props.review.date}</p>
        </div>
      </div>
    )
}

export default ReviewItems