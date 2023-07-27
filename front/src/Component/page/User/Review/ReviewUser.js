import React from "react";
import ReviewUserItems from "./ReviewUserItems";

import './ReviewUser.css';
import Header from "../../../UIComponent/Header";

const ReviewUser = (props) => {
    return (
        <div>
            <Header/>
            <main>
                <div className='container'>
                    {props.reviews.map(el => (
                    <ReviewUserItems key={el.id} openCart={props.openCart} review = {el}/>
                    ))}
                </div>
            </main>
        </div>
    ) ;
}

export default ReviewUser;