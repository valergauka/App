import React from "react";
import Program from './Program';
import Buttons from "../../../UIComponent/buttons/Buttons"


import './Programs.css';

const Review = (props) => {
    console.log(props.reviews)
    return (
        <div>
            <div className="cards">
                {props.reviews.map(el=> (
                    <Program onDelete={props.onDelete} review={el} />
                ))}
            </div>
            <Buttons />
        </div>
    );
}

export default Review;