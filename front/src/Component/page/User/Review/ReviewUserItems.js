import React from 'react';
import './ReviewUserItems.css';

const ReviewUserItems = (props) => {
  const OpenCart = () => {
    props.openCart(props.review);
    props.OpentReview();
  };

  return (
    <div className={'category'}>
      {props.status === 4 && (
        <button
          className="deleteButton"
          onClick={() => props.onDelete(props.review.id)}
        >
          Видалити
        </button>
      )}
      <div className={'link1'} onClick={OpenCart}>
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
