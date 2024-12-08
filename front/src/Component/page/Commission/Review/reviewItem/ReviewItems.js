import React from 'react';

import './ReviewItems.css';

const ReviewItems = (props) => {
  //console.log('ReviewItem props:', props.review);  // Перевірка переданих даних

  const OpenCart = () => {
    props.openCart(props.review);
    props.OpentReview();
  };

  return (
    <div className={'category'} onClick={OpenCart}>
      <div className={'link1'}>
        <h3 className='titleReview'>{props.review.category?.title || 'No Category'}</h3>
        <h5>{props.review.educLevel || 'No Education Level'}</h5>
        <h5>{props.review.nameOp || 'No Operation Name'}</h5>
        <p>{props.review.speciality || 'No Speciality'}</p>
        <p>{props.review.faculty || 'No Faculty'}</p>
        <p className='date'>{props.review.date || 'No Date'}</p>
      </div>
    </div>
  );
};

export default ReviewItems