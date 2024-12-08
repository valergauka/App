import React, { useState, useEffect, useCallback } from "react";
import { MdDeleteForever } from "react-icons/md";
import NET from '../../../../network';
import axios from 'axios';
import { Link } from "react-router-dom";
import { FiUserPlus } from "react-icons/fi";
import FormDelete from '../../../UIComponent/formDelete/FormDelete';
import './Users.css';
import RoleChangeForm from "../../../UIComponent/RoleChangeForm/RoleChangeForm";
import Buttons from "../../../UIComponent/buttons/Buttons";

// Оновлення даних користувача
const UpdateUserForm = ({ user, onClose, onUpdate }) => {
    const [name, setName] = useState(user.name);
    const [email, setEmail] = useState(user.email);
    const [password, setPassword] = useState('');

    const handleUpdate = async () => {
        try {
            const updateData = {
                id: user.id,
                name,
                email,
            };

            // Тільки якщо введено новий пароль, додаємо його в запит
            if (password) {
                updateData.password = password;
            }

            await axios.post(`${NET.APP_URL}/users/update`, updateData);
            onUpdate();
            onClose();
        } catch (error) {
            //console.error('Error updating user:', error.response ? error.response.data : error.message);
        }
    };

    return (
        <div className="updateUserForm">
            <h3>Змінити дані користувача</h3>
            <input
                type="text"
                placeholder="Name"
                value={name}
                onChange={e => setName(e.target.value)}
            />
            <input
                type="email"
                placeholder="Email"
                value={email}
                onChange={e => setEmail(e.target.value)}
            />
            <input
                type="password"
                placeholder="New Password (optional)"
                value={password}
                onChange={e => setPassword(e.target.value)}
            />
            <button onClick={handleUpdate}>ЗМІНИТИ</button>
            <button onClick={onClose}>ВІДМІНИТИ</button>
        </div>
    );
};

const Users = () => {
    const [users, setUsers] = useState([]);
    const [filteredUsers, setFilteredUsers] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [openFormDelete, setOpenFormDelete] = useState(false);
    const [idDelete, setIdDelete] = useState(null);
    const [isDeleted, setIsDeleted] = useState(false);
    const [groupId, setGroupId] = useState('');
    const [updateUser, setUpdateUser] = useState(null);

    // Отримання користувачів
    const fetchUsers = useCallback(async () => {
        const cachedUsers = localStorage.getItem(`users_group_${groupId}`);
        if (cachedUsers) {
            //console.log('Використано кешовані дані');
            setUsers(JSON.parse(cachedUsers));
            setFilteredUsers(JSON.parse(cachedUsers));
        } else {
            //console.log('Завантаження даних з сервера');
            try {
                const response = await axios.get(`${NET.APP_URL}/getUsersByGroupId?id=${groupId}`);
                const initialUsers = response.data.map(user => ({ ...user, openFormRole: false }));
                setUsers(initialUsers);
                setFilteredUsers(initialUsers);
                localStorage.setItem(`users_group_${groupId}`, JSON.stringify(initialUsers));
            } catch (error) {
                //console.error('Помилка при отриманні користувачів:', error.response ? error.response.data : error.message);
            }
        }
    }, [groupId]); // Видалено groupId з залежностей useCallback

    useEffect(() => {
        fetchUsers();
    }, [groupId, fetchUsers]); // Викликаємо fetchUsers, коли groupId змінюється

    // Фільтрація користувачів за пошуковим запитом
    useEffect(() => {
        const results = users.filter(user =>
            user.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
            user.email.toLowerCase().includes(searchTerm.toLowerCase())
        );
        setFilteredUsers(results);
    }, [searchTerm, users]);

    const handleRoleChangeClick = (id) => {
        const updatedUsers = users.map(user => {
            if (user.id === id) {
                return { ...user, openFormRole: true };
            }
            return user;
        });
        setUsers(updatedUsers);
    };

    const handleSubmit = (id) => {
        setIdDelete(id);
        setOpenFormDelete(true);
    };

    const handleDelete = () => {
        axios.delete(`${NET.APP_URL}/users/${idDelete}`)
            .then(response => {
                console.log(response.data);
                setIsDeleted(true);
                alert('Користувача успішно видалено');
            })
            .catch(error => {
                console.error('Помилка видалення користувача', error);
                alert('Помилка видалення користувача');
            });
    };

    useEffect(() => {
        if (isDeleted) {
            fetchUsers();
            setIsDeleted(false);
        }
    }, [isDeleted, fetchUsers]);

    const handleUpdateUserClick = (user) => {
        setUpdateUser(user);
    };

    const handleCloseUpdateForm = () => {
        setUpdateUser(null);
    };

    const handleUserUpdated = () => {
        fetchUsers();
        handleCloseUpdateForm();
    };

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
                            <button
                                className="buttonRole"
                                onClick={() => handleUpdateUserClick(el)}
                            >
                                Змінити дані користувача
                            </button>
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

                </div>
                <Buttons />
            </div>
            {updateUser && (
                <UpdateUserForm
                    user={updateUser}
                    onClose={handleCloseUpdateForm}
                    onUpdate={handleUserUpdated}
                />
            )}
            {openFormDelete && (
                <FormDelete
                    openFormDelete={openFormDelete}
                    setOpenFormDelete={setOpenFormDelete}
                    deleteUser={handleDelete}
                />
            )}
        </div>
    );
};

export default Users;
