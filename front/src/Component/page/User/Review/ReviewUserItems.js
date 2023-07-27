import React, { Component } from 'react';
import { Link } from 'react-router-dom';

import './ReviewUserItems.css';

export class ReviewUserItems extends Component {
  render() {
    return (
      <div className='category' onClick={() => this.props.openCart(this.props.review)} >
        <Link className='link1' to='/reviewuser/cart'>
          <h3 className='titule'>{this.props.review.category}</h3>
          <p><h5>Рівень: {this.props.review.educLevel}</h5></p>
          <h5><p>Назва ОП:</p>{this.props.review.nameOp}</h5>
          <p><h5>Спеціальність:</h5> {this.props.review.speciality}</p>
          <p><h5>Факультет/Інститут:</h5>{this.props.review.faculty}</p>
          <p className='date'>{this.props.review.date}</p>
        </Link>
      </div>
    )
  }
}

export default ReviewUserItems