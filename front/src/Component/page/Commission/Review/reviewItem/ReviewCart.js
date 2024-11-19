import React, { useEffect, useState } from 'react';
import { BsArrowLeftShort, BsTrashFill } from "react-icons/bs";
import { Link } from "react-router-dom";
import Header from "../../../UIComponent/Header";
import NET from '../../../../network';
import axios from 'axios';

import './ReviewCart.css';

const ReviewCart = (props) => {
    const [comment, setComment] = useState([]);
    const [user, setUser] = useState([]);
    

    useEffect(() => {
        const loadComment = async () => {
            const response = await axios.get(`${NET.APP_URL}/comment`);
            setComment(response.data)
        }
        loadComment();
    }, [])


    useEffect(() => {
        const loadUsers = async () => {
            const response = await axios.get(`${NET.APP_URL}/user`);
            setUser(response.data)
        }
        loadUsers();
    }, [])

    const comentari = [];
    comment.map(el => {
        if (Number(el.idReview) === Number(props.cart.map(el => (el.id)))) {
            comentari.push(el)

        }
    })
    const userse = [];
    user.map(el => {
        userse.push(el.name)
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
                <div className="comments">
                    {comentari.map(el =>
                    (
                        <div>
                            <b className="userComment">{userse[el.idUser]}</b>
                            <div className="comentar ">
                                <p>{el.comment}</p>
                                <div className="commentDate">
                                    <b>{el.date}</b>
                                </div>
                            </div>
                        </div>))}
                </div>
            </main>
        </div>
    );
}

export default ReviewCart;