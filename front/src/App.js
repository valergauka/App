import React from "react";

import { Route } from "react-router-dom";
import Sign from "./Sign/Sing";
import Review from "./Component/page/Commission/Review/Review";
import Present from "./Component/page/User/Present/Present";
import ReviewUser from "./Component/page/User/Review/ReviewUser";
import Programs from './Component/page/Admin/review/Programs';
import AddUser from './Component/page/Admin/addUser/AddUser';
import Users from './Component/page/Admin/user/Users';
import NET from './network';
import Approve from "./Component/page/Commission/Review/reviewItem/approve/Approve";
import OPs from "./Component/page/Admin/op/OPs";
import AddOP from "./Component/page/Admin/op/AddOP";
import axios from "axios";
import LoginForm from "./Sign/Form/LoginForm";
import { AuthProvider } from "./Sign/authContext/AuthContext";
import LogHeader from "./Component/UIComponent/logHeader/LogHeader";
import RegistrationForm from "./Sign/Form/RegistrationForm";

class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      orders: [],
      cart: [],
      categories: [
        {
          id: 1,
          title: 'Перейменування кафедри'
        },
        {
          id: 2,
          title: 'Зміна гаранта'
        },
        {
          id: 3,
          title: 'Оновлення складу проєктної групи'
        },
        {
          id: 4,
          title: 'Внесення змін до ОП (ОПП, ОНП)'
        },
        {
          id: 5,
          title: 'Закриття ОП (ОПП, ОНП)'
        },
        {
          id: 6,
          title: 'Проєктна група для започаткування ОП'
        },
        {
          id: 7,
          title: 'Започаткування ОП (ОПП, ОНП)'
        },
        {
          id: 8,
          title: 'Інше'
        },
      ],
      categoriesPdf: [
        {
          id: 1,
          titule: 'Рапорт гаранта',
          name: 'raportguarant'

        },
        {
          id: 2,
          titule: 'Витяг з протоколу кафедри',
          name: 'vitiagKafedri'
        },
        {
          id: 3,
          titule: 'Витяг з протоколу засідання Вченої ради',
          name: 'vitiagVchenoiiRadi'
        },
        {
          id: 4,
          titule: 'Обгрунтування',
          name: 'obgr'
        },
        {
          id: 5,
          titule: 'ОП',
          name: 'op'
        },
        {
          id: 6,
          titule: 'Інше...',
          name: 'other'
        }
      ]
    }
    this.state.currenItems = this.state.reviews
    this.addToOrder = this.addToOrder.bind(this)
    this.openCart = this.openCart.bind(this)
    this.delete = this.delete.bind(this)
  }

  render() {
    return (
      <div >
        <AuthProvider>
          <LogHeader />
          <Route path='/' exact><LoginForm /></Route>
          <Route path='/register' exact><RegistrationForm /> </Route>
          <Route path='/sign' exact><Sign /></Route>
          <Route path="/present" exact><Present onAdd={this.addToOrder} buttons={this.state.categories} orders={this.state.orders} categories={this.state.categoriesPdf} /></Route>

          <Route path="/reviewuser" exact>
            <ReviewUser 
                key={this.state.cart.id} 
                categoriesPdf={this.state.categoriesPdf} 
                cart={this.state.cart} 
                buttons={this.state.categories} 
                openCart={this.openCart} 
                chooseCategory={this.chooseCategory} 
                button={this.state.categories} /></Route>

          <Route path='/review' exact><Review key={this.state.cart.id} cart={this.state.cart} onDelete={this.delete} openCart={this.openCart}  buttons={this.state.categories} /></Route>

          <Route path='/review/cart/approve' exact><Approve onDelete={this.delete} categories={this.state.categories} cart={this.state.cart} /></Route>

          <Route path="/program" exact><Programs categories={this.state.categories} onDelete={this.delete} /></Route>
          <Route path='/adduser' exact><AddUser /></Route>
          <Route path='/addop' exact><AddOP /></Route>
          <Route path='/users' exact><Users onDelete={this.delete} /></Route>
          <Route path='/op'><OPs /> </Route>
        </AuthProvider>
      </div>
    );
  }

  delete(id, link) {
    axios.post(`${NET.APP_URL}${link}`, { id })
      .then(response => {
        console.log(response.data);
        window.location.reload();
      })
      .catch(error => {
        console.error(error);
      });
  }

  addToOrder(item) {
    this.setState({ orders: [this.state.orders, item] })
  }

  openCart(item) {
    this.setState({ cart: [item] })
  }



}

export default App;

