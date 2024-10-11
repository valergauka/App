import React, { useEffect, useState } from 'react';
import './ReviewUserItems.css';
import axios from 'axios';
import NET from '../../../../network';

const ReviewUserItems = (props) => {
  const [files, setFiles] = useState([]);
  const reviewId = props.review.id;

  const OpenCart = () => {
    props.openCart(props.review);
    props.OpentReview();
  };

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
  );
};

export default ReviewUserItems;
