import Buttons from "../../../UIComponent/buttons/Buttons";
import React, { useState, useEffect } from "react";
import { MdDeleteForever } from "react-icons/md";
import NET from '../../../../network';
import axios from 'axios';
import { Link } from "react-router-dom";
import { FiUserPlus } from "react-icons/fi";
import FormDelete from '../../../UIComponent/formDelete/FormDelete';
import './Users.css';
import RoleChangeForm from "../../../UIComponent/RoleChangeForm/RoleChangeForm";

const Users = (props) => {
    const [users, setUsers] = useState([]);
    const [filteredUsers, setFilteredUsers] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [openFormDelete, setOpenFormDelete] = useState(false);
    const [idDelete, setIdDelete] = useState(null);
    const [isDeleted, setIsDeleted] = useState(false);
    const [groupId, setGroupId] = useState('');

    const handleRoleChangeClick = (id) => {
        const updatedUsers = users.map(user => {
            if (user.id === id) {
                return { ...user, openFormRole: true };
            }
            return user;
        });
        setUsers(updatedUsers);
    };

    useEffect(() => {
        axios
            .get(`${NET.APP_URL}/getUsersByGroupId?id=${groupId}`)
            .then((response) => {
                const initialUsers = response.data.map(user => ({ ...user, openFormRole: false }));
                setUsers(initialUsers);
                setFilteredUsers(initialUsers);
            })
            .catch((error) => {
                console.error(error);
            });
    }, [groupId]);

    useEffect(() => {
        const results = users.filter(user =>
            user.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
            user.email.toLowerCase().includes(searchTerm.toLowerCase())
        );
        setFilteredUsers(results);
    }, [searchTerm, users]);

    const handleSubmit = (id) => {
        setIdDelete(id);
        setOpenFormDelete(true);
    };

    const handleDelete = () => {
        axios.delete(`${NET.APP_URL}/users/${idDelete}`)
            .then(response => {
                console.log(response.data);
                setIsDeleted(true);
                // Тут ви можете виконати додаткові дії після видалення
            })
            .catch(error => {
                console.error('Помилка видалення користувача', error);
            });
    };

    useEffect(() => {
        if (isDeleted) {
            // Оновлюємо сторінку після видалення користувача
            window.location.reload();
        }
    }, [isDeleted]);

    return (
        <div>
            <div className="butonAddUser">
                <Link to={'/adduser'}>
                    <button>
                        <FiUserPlus />
                        <span>Додати користувача</span>
                    </button>
                </Link>
            </div>
            <div className="titlesUser">
                <h2 className="title" onClick={() => setGroupId(1)}>Користувачі</h2>
                <h2 className="title" onClick={() => setGroupId(2)}>Комісія</h2>
                <h2 className="title" onClick={() => setGroupId(3)}>Адмін</h2>
            </div>
            <div className="searchBar">
                <input
                    type="text"
                    placeholder="Пошук користувачів..."
                    value={searchTerm}
                    onChange={e => setSearchTerm(e.target.value)}
                />
            </div>
            <div className="users">
                <div className="usersCarts">
                    {filteredUsers.map(el => (
                        <div className="userCart" key={el.id}>
                            <MdDeleteForever className="deliteUser" onClick={() => handleSubmit(el.id)} />
                            <p><b>Ім'я: &nbsp;</b>{el.name}</p>
                            <p><b>Email: &nbsp;</b><a href={`mailto: ${el.email}`}>{el.email}</a></p>
                            {
                                !el.openFormRole && (
                                    <button
                                        className="buttonRole"
                                        onClick={() => handleRoleChangeClick(el.id)}
                                    >
                                        Змінити роль користувача
                                    </button>
                                )
                            }
                            {el.openFormRole && (
                                <div>
                                    <RoleChangeForm userId={el.id} openFormRole={() => handleRoleChangeClick(el.id)} />
                                </div>
                            )}
                        </div>
                    ))}
                    {openFormDelete && (
                        <FormDelete link='/users' text={"цього користувача"} isOpen={openFormDelete} onClose={() => setOpenFormDelete(false)} onDelete={handleDelete} />
                    )}
                </div>
            </div>
            <Buttons />
        </div>
    );
}

export default Users;
