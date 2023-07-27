import React from "react";

import { Route } from "react-router-dom";
import Sign from "./Sign/Sing";
import Review from "./Component/page/Commission/Review/Review";
import ReviewItem from "./Component/page/Commission/Review/reviewItem/ReviewItem";
import FormLb from "./Component/page/User/Present/Form/FormLb";
import FormPdf from "./Component/page/User/Present/Form/FormPdf";
import Present from "./Component/page/User/Present/Present";
import ReviewUser from "./Component/page/User/Review/ReviewUser";
import ReviewUserItem from "./Component/page/User/Review/ReviewUserItem";
import Programs from './Component/page/Admin/review/Programs';
import AddUser from './Component/page/Admin/addUser/AddUser';
import Users from './Component/page/Admin/user/Users';
import NET from './network';
import Approve from "./Component/page/Commission/Review/reviewItem/approve/Approve";
import OPs from "./Component/page/Admin/op/OPs";
import AddOP from "./Component/page/Admin/op/AddOP";
import axios from "axios";

class App extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      orders: [],
      cart: [],
      currenItems: [],
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
          title: 'Закриття ОП'
        },
        {
          id: 6,
          title: 'Затвердження проєктної групи'
        },
        {
          id: 7,
          title: 'Започаткування ОП'
        }, 
        {
          id: 8,
          title: 'Інше'
        }
        
      ],
      reviews: [],
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
          titule: 'Витяг з протоколу засідання вченої ради',
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
    this.addToOrder =this.addToOrder.bind(this)
    this.openCart = this.openCart.bind(this)
    this.chooseCategory = this.chooseCategory.bind(this)
    this.deleteReview = this.deleteReview.bind(this)
    this.deleteOp = this.deleteOp.bind(this)
    this.deleteUser = this.deleteUser.bind(this)
  }



  componentDidMount() {
    fetch(`${NET.APP_URL}/review`)
        .then(res => res.json())
        .then(
            (result) => {
              this.setState({
                reviews: result
              });
            },
            (error) => {
              this.setState({
                error
              });
            }
        )
  }

  render(){
    const { currenItems} = this.state
    this.state.currenItems=this.state.reviews
   return (
     <div >
      <Route path='/' exact ><Sign/></Route>

      <Route path="/present" exact><Present onAdd={this.addToOrder} buttons={this.state.categories}/></Route>
      <Route path="/present/form" exact><FormLb key={this.state.orders.id} orders={this.state.orders}/></Route>
      <Route path="/present/form/form" exact><FormPdf key={this.state.categoriesPdf.id} categories={this.state.categoriesPdf} orders={this.state.orders}/></Route>
      <Route path="/reviewuser" exact><ReviewUser  openCart={this.openCart} chooseCategory={this.chooseCategory} reviews={currenItems} buttons={this.state.categories} /></Route>
      <Route path="/reviewuser/cart" exact><ReviewUserItem categoriesPdf={this.state.categoriesPdf} cart={this.state.cart}/></Route>
      
      <Route path='/review' exact><Review  openCart={this.openCart} chooseCategory={this.chooseCategory} reviews={currenItems} buttons={this.state.categories} /></Route>
      <Route path="/review/cart" exact><ReviewItem  cart={this.state.cart}  /></Route>
      <Route path='/review/cart/approve' exact><Approve cart={this.state.cart}/></Route>
    
      <Route path="/program" exact><Programs reviews={currenItems} onDelete={this.deleteReview} /></Route>
      <Route path='/adduser' exact><AddUser/></Route>
      <Route path='/users' exact><Users onDelete={this.deleteUser}/></Route>
      <Route path='/op'><OPs onDelete={this.deleteOp}/> </Route>
      <Route path='/addop'><AddOP/> </Route>
      
    </div>
  );
  }

  deleteReview (id)  {
      axios.post(`${NET.APP_URL}/deleteReview`, {id})
      .then(response => {
        // Обробка відповіді від сервера
        console.log(response.data);
        window.location.reload();
      })
      .catch(error => {
        // Обробка помилки
        console.error(error);
      });
      
}

deleteOp (id)  {
  axios.post(`${NET.APP_URL}/deleteOp`, {id})
  .then(response => {
    // Обробка відповіді від сервера
    console.log(response.data);
    window.location.reload();
  })
  .catch(error => {
    // Обробка помилки
    console.error(error);
  }); 
}

deleteUser(id) {
  axios.post(`${NET.APP_URL}/deleteUser`, {id})
  .then(response => {
    // Обробка відповіді від сервера
    console.log(response.data);
    window.location.reload();
  })
  .catch(error => {
    // Обробка помилки
    console.error(error);
  }); 
}

  addToOrder(item) {
    this.setState({orders: [this.state.orders, item] })
  }

  openCart(item) {
    this.setState({cart: [item] })
  }

  chooseCategory(category) {
    if(category === 'all') {
      this.setState({currenItems: this.state.reviews})
      return
    }

    this.setState({
      currenItems: this.state.reviews.filter(el => el.category === category)
    })
  }

}

export default App;

