import React, { useState } from "react";
import { debounce } from 'lodash';
import Program from './Program';
import Buttons from "../../../UIComponent/buttons/Buttons";
import FormDelete from "../../../UIComponent/formDelete/FormDelete";
import axios from "axios";
import NET from "../../../../network";
import './Programs.css';

const Programs = ({ categories, onDelete }) => {
    const [openFromDelete, setOpenFormDelete] = useState(false);
    const [id, setId] = useState(null);
    const [filteredReviews, setFilteredReviews] = useState([]);
    const [activeButton, setActiveButton] = useState(0);

    const fetchReviews = debounce((id) => {
        axios.post(`${NET.APP_URL}/review/status`, { id })
            .then(response => {
                setFilteredReviews(response.data);
            })
            .catch(error => {
                if (error.response && error.response.status === 429) {
                    console.error("Занадто багато запитів. Будь ласка, спробуйте знову пізніше.");
                    // Тут можна показати повідомлення для користувача
                } else {
                    console.error("Помилка при отриманні відгуків:", error.message);
                }
            });
    }, 1000);

    const handleSubmitStateButton = (id) => {
        setActiveButton(id);
        fetchReviews(id);
    };

    const handleSubmit = (id) => {
        setId(id);
        setOpenFormDelete(true);
    };

    const handleDelete = () => {
        if (id) {
            axios.post(`${NET.APP_URL}/reviewDelete`, { id })
                .then(() => {
                    setFilteredReviews(prevReviews => prevReviews.filter(review => review.id !== id));
                    setOpenFormDelete(false);
                })
                .catch(error => {
                    console.error("Помилка при видаленні відгуку:", error);
                });
        } else {
            console.error("Немає дійсного id для видалення");
        }
    };

    const buttonLabels = [
        { id: 0, label: 'Всі' },
        { id: 1, label: 'Подані' },
        { id: 2, label: 'Затверджені' },
        { id: 3, label: 'Архівовані' },
    ];

    return (
        <div>
            <div className="buttonStates">
                {buttonLabels.map(({ id, label }) => (
                    <button
                        key={id}
                        onClick={() => handleSubmitStateButton(id)}
                        className={`buttonState ${activeButton === id ? 'active' : ''}`}
                    >
                        {label}
                    </button>
                ))}
            </div>

            <div className="formCards">
                <div className="cards">
                    {filteredReviews.map(el => (
                        <Program
                            categories={categories}
                            key={el?.id}
                            openButtonArh={activeButton === 2}
                            openButtonComm={activeButton === 1}
                            onDelete={onDelete}
                            review={el}
                            handleSubmit={handleSubmit}
                        />
                    ))}
                </div>
            </div>

            {openFromDelete && (
                <FormDelete
                    link='/program'
                    text="подану заяву"
                    isOpen={openFromDelete}
                    onClose={() => setOpenFormDelete(false)}
                    onDelete={handleDelete}
                />
            )}
            <Buttons />
        </div>
    );
};

export default Programs;
