import { BsArrowLeftShort } from "react-icons/bs";
import { Link } from "react-router-dom";
import Button from "../../../../UIComponent/Button";
import React, {useState } from 'react';
import Commentar from '../../../../UIComponent/comment/Commentar';

import './ReviewItem.css';

const ReviewItem = (props) => {
    const id_review = Number(props.cart.map(el => (el.id)));
    const id_user = 1;
    const [value, setValue] = useState({ idReview: id_review, idUser: id_user });

    return (
        <div>
            <main className='mainCarts'>
                <Link to='/review' className='backCart' ><BsArrowLeftShort /></Link>
                <form className='cartForm '>
                    <h2 className='titleForm'>{props.cart.map(el => (el.category))}</h2>
                    <div className="formLable">
                        <h5>Рівень: {props.cart.map(el => (el.educLevel))}</h5>
                        <h5>Галузь знань: {props.cart.map(el => (el.branch))}</h5>
                        <h5>Спеціальність: {props.cart.map(el => (el.speciality))}</h5>
                        <div className={`spetializanion ${(value['speciality'] === '014 Середня освіта' ||
                            value['speciality'] === '015 Професійна освіта' ||
                            value['speciality'] === '035 Філологія' ||
                            (value['speciality'] === '227' && value['leveleducc'] === 'Магістр'))
                            && 'active'}`}>
                            <h5>Спеціалізація:  {props.cart.map(el => (el.specialisation))}</h5>
                        </div>
                        <h5>Освітня програма:  {props.cart.map(el => (el.nameOp))}</h5>
                        <h5>Гарант програми:  {props.cart.map(el => (el.guaranty))}</h5>
                        <h5>Структурний підрозділ:  {props.cart.map(el => (el.structural))}</h5>
                        <h5>Факультет/Інститут:  {props.cart.map(el => (el.faculty))}</h5>
                        <h5 className="dataCart">{props.cart.map(el => (el.date))}</h5>
                    </div>
                    <h4>Перегляньте документи:</h4>
                    {/* <div className="cartFormPDF">
                    <a href={props.cart.map(el => (el.raportguarant))} rel="noopener noreferrer"> Рапорт гаранта</a>
                    <a>Витяг з протоколу кафедри</a>
                    <a>Витяг з протоколу засідання вченої ради</a>
                    <a>Обгрунтування</a>
                </div> */}
                    <Link className='buttonLink' to='/review/cart/approve'>
                        <Button title="Затвердити" />
                    </Link>

                </form>
                <div className='comentForm'>
                    <textarea className='comment' placeholder='Залишіть свій коментар тут...' value={value['comment']}
                        onChange={(e) => setValue({
                            ...value,
                            ['comment']: e.target.value
                        })}></textarea>
                    <button className='buttonComent'>Надіслати</button>
                </div>
                <Commentar cart={props.cart}/>
            </main>
        </div>

    );
}

export default ReviewItem;