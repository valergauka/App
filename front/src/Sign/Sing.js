import { Link } from "react-router-dom";
import React from "react";
import Button from "../Component/UIComponent/Button";

import './Sing.css';


const Sign = () => {
    return (
        <div className="menuSing">
            <Link to="/review">
                <Button title="Комісія"/>
            </Link>
            <Link to="/present">
                <Button title="Користувач"/>
            </Link>
            <Link to="/program">
                <Button title="Адмін"/>
            </Link>
            <div>
    </div>
        </div>
    );

}

export default Sign;