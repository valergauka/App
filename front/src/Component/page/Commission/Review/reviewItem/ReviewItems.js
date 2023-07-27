import React, { Component } from 'react';
import { Link } from 'react-router-dom';

import './ReviewItems.css';

export class ReviewItems extends Component {
  render() {
    return (
      <div className='category' onClick={() => this.props.openCart(this.props.review)} >
        <Link className='link1' to='/review/cart'>
          <h3 className='titule'>{this.props.review.category}</h3>
          <h5>{this.props.review.educLevel}</h5>
          <h5>{this.props.review.nameOp}</h5>
          <p><h5>Спеціальність:</h5> {this.props.review.speciality}</p>
           <p><h5>Факультет/Інститут:</h5>{this.props.review.faculty}</p>
          <p className='date'>{this.props.review.date}</p>
        </Link>
      </div>
    )
  }
}

export default ReviewItems