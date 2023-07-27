import React, { useState } from "react";
import './Program.css';
import { FiTrash2 } from "react-icons/fi";

const Program = (props) => {
    let [cardOpen, setCardOpen] = useState(false);

    return (
        <div >
            <div className="card">
                <p className='title'>{props.review.category}</p>
                <p>Рівень:  {props.review.educLevel}</p>
                <p>Назва ОП: {props.review.nameOp}</p>
                <p>Спеціальність: {props.review.speciality}</p>
                <p>Галузь знань:  {props.review.branch}</p>
                <p>Гарант програми:  {props.review.guaranty}</p>
                <p>Структурний підрозділ:  {props.review.structural}</p>
                <p>Факультет/Інститут: {props.review.faculty}</p>
                <p className='date'>{props.review.date}</p>
                <FiTrash2 className={`iconCard ${cardOpen && 'active '}`} onClick={() => props.onDelete(props.review.id)}/>
               
            
            
            </div>

        </div>
    );
}

export default Program;