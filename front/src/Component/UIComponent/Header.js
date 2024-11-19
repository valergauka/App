import React from 'react';
import { Link } from 'react-router-dom';
import Button from './Button';

import './Header.css';


export default function Header() {
  return (
      <div className='headerNav'>
          <Link  to='/present' className='link1'><Button title='Подати'/></Link>
          <Link to='/reviewuser' className='link2'><Button title='Переглянути'/></Link>  
      </div> 
  )
}
