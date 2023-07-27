import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import Button from '../../../UIComponent/Button';

import './Present.css';

export class PresentItem extends Component {
  render() {
    return (
        <div>
          <div onClick={() => this.props.onAdd(this.props.button)}>
            <Link className='buttoncomentFormLink'  to='/present/form'>
                <Button title={this.props.button.title}/>
            </Link>
            </div>  
        </div>
      
      
      )
  }
}

export default PresentItem