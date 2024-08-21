import React, { useState, useEffect } from "react";
import './Program.css';
import { FiTrash2 } from "react-icons/fi";
import { BsArchive } from "react-icons/bs";
import axios from "axios";
import NET from "../../../../network";

const Program = (props) => {
    const id = Number(props.review.id)
    const data = { id: id };
    const handleSubmit=()=> {
        axios.post(`${NET.APP_URL}/updateStatus`, data)
            .then(response => {
                window.location.reload();
            })
            .catch(error => {
                console.error(error);
            });
    }


    return (
        <div >
            <div className="card">
                <b className='title'>{props.review.category.title}</b>
                <p><b>Рівень:</b>  {props.review.educLevel}</p>
                <p><b>Назва ОП:</b> {props.review.nameOp}</p>
                <p><b>Спеціальність:</b> {props.review.speciality}</p>
                <p><b>Галузь знань:</b>  {props.review.branch}</p>
                <p><b>Гарант програми:</b>  {props.review.guarantor}</p>
                <p><b>Структурний підрозділ:</b>  {props.review.structural}</p>
                <p><b>Факультет/Інститут:</b> {props.review.faculty}</p>
                <p>{props.review.user ? props.review.user.name : ''}</p>
                <b className='date'>{props.review.date}</b>
                <div>
                    <FiTrash2 className={'iconCard '} onClick={() => props.handleSubmit(props.review.id)} />
                    {
                        props.openButtonArh &&
                        <div onClick={handleSubmit} >
                            <BsArchive className="buttonArchive" />
                        </div>

                    }
                </div>

            </div>
        </div>
    );
}

export default Program;