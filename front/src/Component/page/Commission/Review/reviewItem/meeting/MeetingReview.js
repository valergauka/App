import React from 'react';
import './MeetingReview.css';
import { GrClose } from 'react-icons/gr';

const MeetingReview = (props) => {
  const categoryId = props.review.category_id;
  const selectedCategory = props.categories.find((category) => category.id === categoryId);
  const categoryTitle = selectedCategory ? selectedCategory.title : 'Категорія не знайдена';
  
  return (
    <div className="meetingCartReview">
      <GrClose onClick={() => props.handleSelectReview(props.review.id)} className="deleteReviewForMeeting" />
      <h5 className="titule">{categoryTitle}</h5>
      <p>{props.review.educLevel}</p>
      <p>{props.review.nameOp}</p>
      <p>Дата:&nbsp;&nbsp;{props.review.date}</p>
    </div>
  );
};

export default MeetingReview;
