import { Link, useHistory } from "react-router-dom";
import React, { useEffect } from "react";
import Button from "../Component/UIComponent/Button";
import { useLocation } from 'react-router-dom';


import './Sing.css';


const Sign = () => {
    const history = useHistory();
    const location = useLocation();
    const { userGroup } = location.state;
    if (userGroup.length === 1) {
        // Якщо userGroup має тільки один елемент, перенаправити користувача на відповідний шлях
        const user = userGroup[0];
        if (user.id === 1) {
            history.push('/present');
        } else if (user.id === 2) {
            history.push('/review');
        } else if (user.id === 3) {
            history.push('/program');
        }
        // Після перенаправлення не потрібно відображати жодних кнопок, оскільки користувач вже перенаправлений.
        return null;
    }
    //console.log(userGroup)
    return (
        <div className="menuSing">
            {userGroup.map((el) => (
                <React.Fragment key={el.id}>
                    {el.id === 1 && (
                        <Link to="/present">
                            <Button title="Користувач" />
                        </Link>
                    )}
                    {el.id === 2 && (
                        <Link to="/review">
                            <Button title="Комісія" />
                        </Link>
                    )}
                    {el.id === 3 && (
                        <Link to="/program">
                            <Button title="Адмін" />
                        </Link>
                    )}
                </React.Fragment>
            ))}
        </div>

    );

}

export default Sign;