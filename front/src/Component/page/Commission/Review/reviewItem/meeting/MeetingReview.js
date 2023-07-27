import React from 'react';
import './MeetingReview.css';
import { GrClose } from 'react-icons/gr';

const MeetingReview = (props) => {
  return (
    <div className="meetingCartReview">
      <GrClose onClick={() => props.handleSelectReview(props.review.id)} className="deleteReviewForMeeting" />
      <h3 className="titule">&nbsp;&nbsp;&nbsp;&nbsp;{props.review.category}</h3>
      <h5>&nbsp;&nbsp;{props.review.educLevel}</h5>
      <h5>&nbsp;&nbsp;{props.review.nameOp}</h5>
      <h5>&nbsp;&nbsp;Спеціальність:&nbsp;&nbsp;{props.review.speciality}</h5>
      <h5>&nbsp;&nbsp;Дата:&nbsp;&nbsp;{props.review.date}</h5>
    </div>
  );
};

export default MeetingReview;
