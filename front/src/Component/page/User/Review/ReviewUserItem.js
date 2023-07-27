import React, { useEffect, useState } from 'react';
import { BsArrowLeftShort } from "react-icons/bs";
import { Link } from "react-router-dom";
import Header from "../../../UIComponent/Header";
import NET from '../../../../network';
import axios from 'axios';

import './ReviewUserItem.css';
import Commentar from '../../../UIComponent/comment/Commentar';

const ReviewUserItem = (props) => {
    
    const [approves, setApproves] = useState([]);

    useEffect(() => {
        const loadApprove = async () => {
            const response = await axios.get(`${NET.APP_URL}/approve`);
            setApproves(response.data)
        }
        loadApprove();
    }, [])




    const approve = [];
    approves.map(el => {
        if (Number(el.idReview) === Number(props.cart.map(el => (el.id)))) {
            approve.push(el)

        }
    })


    return (
        <div>
            <Header />
            <main className='mainCarts'>
                <Link to='/reviewuser' className='backCart' ><BsArrowLeftShort /></Link>
                {/* <div className="trash"><BsTrashFill/></div> */}
                <form className='cartForm '>
                    <h2>{props.cart.map(el => (el.category))}</h2>
                    <div>
                        <h5>Рівень: {props.cart.map(el => (el.educLevel))}</h5>
                        <h5>Освітня програма:  {props.cart.map(el => (el.nameOp))}</h5>
                        <h5>Спеціальність:  {props.cart.map(el => (el.speciality))}</h5>
                        <h5>Галузь знань:  {props.cart.map(el => (el.branch))}</h5>
                        <h5>Гарант програми:  {props.cart.map(el => (el.guaranty))}</h5>
                        <h5>Структурний підрозділ:  {props.cart.map(el => (el.structural))}</h5>
                        <h5>Факультет/Інститут:  {props.cart.map(el => (el.faculty))}</h5>
                        <h5>Дата подання:  {props.cart.map(el => (el.date))}</h5>
                    </div>
                    <h4>Перегляньте документи:</h4>
                    {/* <div className="cartFormPDF">
                    <a href={props.cart.map(el => (el.raportguarant))} target='_blank' rel="noopener noreferrer">Рапорт гаранта</a>
                    <a>Витяг з протоколу кафедри</a>
                    <a>Витяг з протоколу засідання вченої ради</a>
                    <a>Обгрунтування</a>
                </div> */}
                </form>

                {
                    approve.map(el => (
                        <div className='aprover'>
                            <h3>Затвердження</h3>
                            <div className='aproveR'>
                                <div className="aproveReview">
                                    <h5>Протокол засідання Комісії</h5>
                                    <div className='committeDateAndNumber'>
                                        <p><b>№ </b>{el.committeMNNumber}</p>
                                        <p><b>Дата:</b> {el.committeMNDate}</p>
                                    </div>
                                </div>
                                <div className="aproveReview">
                                    <h5>Протокол засідання Вченої ради</h5>
                                    <div className='committeDateAndNumber'>
                                        <p><b>№</b> {el.committeSCNumber}</p>
                                        <p><b>Дата:</b> {el.committeSCDate}</p>
                                    </div>
                                </div>
                                <div className="aproveReview">
                                    <h5>Наказ про утвердження</h5>
                                    <div className='committeDateAndNumber'>
                                        <p><b>№</b> {el.orderNumber}</p>
                                        <p><b>Дата:</b> {el.orderDate}</p>
                                    </div>
                                </div>
                            </div>
                            <div className='resolution'>
                                <h5>Ухвала комісії</h5>
                                <p>{el.resolution}</p>
                            </div>
                        </div>
                    ))
                }
                <Commentar cart={props.cart}/>
            </main>
        </div>

    );
}

export default ReviewUserItem;