import React, { useEffect, useState } from 'react';
import './ReviewUserItems.css';
import axios from 'axios';
import NET from '../../../../network';

const ReviewUserItems = (props) => {
  const [files, setFiles] = useState([]);
  const reviewId = props.review.id;

  useEffect(() => {
    // Make an API request to fetch files by reviewId
    axios.get(`${NET.APP_URL}/files/${reviewId}`)
      .then(response => {
        setFiles(response.data);
      })
      .catch(error => {
        console.error('Error fetching files:', error);
      });
  }, [reviewId]);

  const OpenCart = () => {
    props.openCart(props.review);
    props.OpentReview();
  };

  return (
    <div className={'category'} onClick={OpenCart}>
      <div className={'link1'}>
        <h3 className='titleReview'>{props.review.category.title}</h3>
        <p><h5>Рівень: {props.review.educLevel}</h5></p>
        <h5><p>Назва ОП:</p>{props.review.nameOp}</h5>
        <p><h5>Спеціальність:</h5> {props.review.speciality}</p>
        <p><h5>Факультет/Інститут:</h5>{props.review.faculty}</p>
        <p className='date'>{props.review.date}</p>
      </div>
    </div>
  );
};

export default ReviewUserItems;
