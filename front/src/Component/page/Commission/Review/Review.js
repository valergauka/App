import React from 'react';
import Button from '../../../UIComponent/Button';
import './Review.css';
import ReviewItems from './reviewItem/ReviewItems';

export default function Review(props) {

  return (
    <div>
      <main>
        <div className='reviewMenu'>
          <div className='buttonNav' onClick={() => props.chooseCategory('all')} >
            <Button title='всі подані' />
          </div>
          {props.buttons.map(but => (
            <div className='buttonNav' key={but.id} onClick={() => props.chooseCategory(but.title)}><Button title={but.title} /></div>
          ))}
        </div>
        <div className='container'>
          {props.reviews.map(el => (
            <ReviewItems key={el.id} openCart={props.openCart} review={el} />
          ))}
        </div>
      </main>
    </div>

  )
}
