import React, { useEffect, useState } from 'react';
import { BsArrowLeftShort } from "react-icons/bs";
import axios from 'axios';

import Header from "../../../UIComponent/Header";
import Commentar from '../../../UIComponent/comment/Commentar';
import ApproveOutput from '../../../ApproveInput/ApproveOutput';
import FileList from '../../../UIComponent/FileList/FileList';
import NET from '../../../../network';

import './ReviewUserItem.css';

const ReviewUserItem = (props) => {
    const approve = props.cart[0].approve;
    const reviewId = Number(props.cart.map(el => (el.id))) 

    const [comment, setComment] = useState([]);

    const comentar = [];
    comment.map(el => {
        if (Number(el.idReview) === Number(props.cart.map(el => (el.id)))) {
            comentar.push(el.comment)
        }
    })

    useEffect(() => {
        const loadComment = async () => {
            const response = await axios.get(`${NET.APP_URL}/comment`);
            setComment(response.data)
        }
        loadComment();
    }, [])

    const CloseForm = () => {
        props.CloseCart();
    }

    return (
        <div>
            <Header />
            <main className='mainCartsReview'>
                <div className='backCart' onClick={() => CloseForm()} ><BsArrowLeftShort /></div>
                <form className='cartForm '>
                    <h2>{props.cart.map(el => el.category.title)}</h2>
                    <div>
                        <h5>Рівень: {props.cart.map(el => (el.educLevel))}</h5>
                        <h5>Освітня програма:  {props.cart.map(el => (el.nameOp))}</h5>
                        <h5>Спеціальність:  {props.cart.map(el => (el.speciality))}</h5>
                        <h5>Галузь знань:  {props.cart.map(el => (el.branch))}</h5>
                        <h5>Гарант програми:  {props.cart.map(el => (el.guarantor))}</h5>
                        <h5>Структурний підрозділ:  {props.cart.map(el => (el.structural))}</h5>
                        <h5>Факультет/Інститут:  {props.cart.map(el => (el.faculty))}</h5>
                        <h5>Дата подання:  {props.cart.map(el => (el.date))}</h5>
                    </div>
                    
                    <FileList idUser={1} reviewId={reviewId}/>
                </form>
                <div className='outputApprove'>
                    <ApproveOutput approve={approve} />
                </div>

                <Commentar idReview={reviewId} />

            </main>
        </div>

    );
}

export default ReviewUserItem;
