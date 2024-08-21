import React, { useState, useEffect } from "react";
import Program from './Program';
import Buttons from "../../../UIComponent/buttons/Buttons"
import FormDelete from "../../../UIComponent/formDelete/FormDelete";
import axios from "axios";
import NET from "../../../../network";
import './Programs.css';

const Programs = (props) => {
    const [openFromDelete, setOpenFormDelete] = useState(false);
    const [id, setId] = useState(null);
    const [filteredReviews, setFilteredReviews] = useState([]);
    const [openButtonArh, setOpenButtonArh] = useState(true);

    useEffect(() => {
        handleSubmitStateButton(0); // Викликати функцію після монтування компонента
    }, []); // Порожній масив залежностей означає, що ефект викликається лише раз, після першого рендерингу

    const handleSubmit = (id) => {
        setId(id)
        setOpenFormDelete(true)
    }

    const handleSubmitStateButton = (id) => {
        if (id === 2) {
            setOpenButtonArh(true)
        } else {
            setOpenButtonArh(false)
        }

        axios.post(`${NET.APP_URL}/review/status`, { id: id })
            .then(response => {
                setFilteredReviews(response.data);
            })
            .catch(error => {
                console.error(error);
                // Обробка помилки (якщо є)
            });
    };

    const handleDelete = () => {
        axios.post(`${NET.APP_URL}/reviewDelete`, { id: id })
            .then((response) => {
                window.location.reload();
                // You can perform additional actions here, such as updating the UI or reloading data.
            })
            .catch((error) => {
                console.error(error);
                // Handle errors if the delete request fails
            });
        setOpenFormDelete(false);
    };

    return (
        <div>
            <div className="buttonStates">
                <button onClick={() => handleSubmitStateButton(0)} className="buttonState">Всі</button>
                <button onClick={() => handleSubmitStateButton(1)} className="buttonState">Подані</button>
                <button onClick={() => handleSubmitStateButton(2)} className="buttonState">Затверджені</button>
                <button onClick={() => handleSubmitStateButton(3)} className="buttonState">Архівовані</button>

            </div>
            <div className="formCards">
                <div className="cards">
                    {filteredReviews.map(el => (
                        <Program categories={props.categories} key={el.id} openButtonArh={openButtonArh} onDelete={props.onDelete} review={el} handleSubmit={handleSubmit} />
                    ))}
                </div>
            </div>
            {openFromDelete && (
                <FormDelete link='/program' text={"подану заяву"} isOpen={openFromDelete} onClose={() => setOpenFormDelete(false)} onDelete={handleDelete} />
            )}
            <Buttons />
        </div>
    );
}

export default Programs;
