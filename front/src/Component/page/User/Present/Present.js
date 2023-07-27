import React from 'react';
import PresentItem from './PresenItem';
import Header from '../../../UIComponent/Header';
import './Present.css';

class Present extends React.Component {
  render(){ 
    return (
      <div>
        <Header/>
      <main className='buttons'>
        {this.props.buttons.map(but => (
            <PresentItem key={but.id} button={but} onAdd={this.props.onAdd}/>
        ))}
      </main>
      </div>
      
    )
  }
}

export default Present;
