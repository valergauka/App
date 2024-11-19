import React, { useState, useEffect } from "react";
import './Program.css';
import { FiTrash2 } from "react-icons/fi";
import { BsArchive } from "react-icons/bs";
import axios from "axios";
import NET from "../../../../network";

const Program = (props) => {
    const id = Number(props.review.id);
    const data = { id: id, statusId: 3 };
    const [users, setUsers] = useState([]);
    const [selectedUserId, setSelectedUserId] = useState(props.review.responsable[0] ? props.review.responsable[0].id : "");

    const handleSubmit = () => {
        axios.post(`${NET.APP_URL}/updateStatus`, data)
            .then(response => {
                setTimeout(() => {
                    window.location.reload();
                }, 500);
            })
            .catch(error => {
                setTimeout(() => {
                    window.location.reload();
                }, 500);
                console.error("Помилка при оновленні статусу:", error);
            });
    };
    console.log(props.review.responsable[0]?.name)
    const handleAssignUser = (userId) => {
        setSelectedUserId(userId); // Вибір відповідального
        const assignData = {
            reviewId: id,
            userId: userId,
        };
        axios.post(`${NET.APP_URL}/assignUser`, assignData)
            .then(response => {
                console.log(response.data);
            })
            .catch(error => {
                console.error("Помилка при призначенні користувача:", error);
            });
    };

    useEffect(() => {
        axios
            .get(`${NET.APP_URL}/getUsersByGroupId?id=${2}`)
            .then((response) => {
                const initialUsers = response.data.map(user => ({ ...user, openFormRole: false }));
                setUsers(initialUsers);
            })
            .catch((error) => {
                console.error("Помилка при отриманні користувачів:", error);
            });
    }, []);

    return (
        <div>
            <div className="card">
                <b className='title'>{props.review.category.title}</b>
                <p><b>Рівень:</b> {props.review.educLevel}</p>
                <p><b>Назва ОП:</b> {props.review.nameOp}</p>
                <p><b>Спеціальність:</b> {props.review.speciality}</p>
                <p><b>Спеціалізація:  </b>{props.review.specialisation}</p>
                <p><b>Галузь знань:</b> {props.review.branch}</p>
                <p><b>Гарант програми:</b> {props.review.guarantor}</p>
                <p><b>Структурний підрозділ:</b> {props.review.structural}</p>
                <p><b>Факультет/Інститут:</b> {props.review.faculty}</p>
                <p>{props.review.user ? props.review.user.name : ''}</p>

                {props.openButtonComm && (
                    <div className="user-selection">
                        {selectedUserId === "" ? (
                            <select
                                value={selectedUserId}
                                onChange={(e) => handleAssignUser(e.target.value)}
                            >
                                <option value="" disabled>Оберіть користувача</option>
                                {users.map((user) => (
                                    <option key={user.id} value={user.id}>
                                        {user.name}
                                    </option>
                                ))}
                            </select>
                        ) : (
                                <p><b>Відповідальний:</b> {users.find(user => user.id === selectedUserId)?.name || props.review.responsable[0]?.name}</p>
                        )}
                    </div>
                )}

                <b className='date'>{props.review.date}</b>

                <div>
                    <FiTrash2 className={'iconCard '} onClick={() => props.handleSubmit(props.review.id)} />
                    {props.openButtonArh && (
                        <div onClick={handleSubmit}>
                            <BsArchive className="buttonArchive" />
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
};

export default Program;
