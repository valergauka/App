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

            // Only include password if it is not empty
            if (password) {
                updateData.password = password;
            }

            await axios.post(`${NET.APP_URL}/users/update`, updateData);
            onUpdate();
            onClose();
        } catch (error) {
            console.error('Error updating user:', error.response ? error.response.data : error.message);
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
    const [updateUser, setUpdateUser] = useState(null); // State to hold the user being updated

    const fetchUsers = async () => {
        try {
            const response = await axios.get(`${NET.APP_URL}/getUsersByGroupId?id=${groupId}`);
            const initialUsers = response.data.map(user => ({ ...user, openFormRole: false }));
            setUsers(initialUsers);
            setFilteredUsers(initialUsers);
        } catch (error) {
            console.error('Помилка при отриманні користувачів:', error.response ? error.response.data : error.message);
        }
    };

    useEffect(() => {
        if (groupId) {
            fetchUsers();
        }
    }, [groupId]);

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

    const handleUpdateUserClick = (user) => {
        setUpdateUser(user); // Set the user to be updated
    };

    const handleCloseUpdateForm = () => {
        setUpdateUser(null); // Close the update form
    };

    const handleUserUpdated = () => {
        fetchUsers(); // Оновлюємо список користувачів
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
                                onClick={() => handleUpdateUserClick(el)} // Open update form for the selected user
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
                    {openFormDelete && (
                        <FormDelete link='/users' text={"цього користувача"} isOpen={openFormDelete} onClose={() => setOpenFormDelete(false)} onDelete={handleDelete} />
                    )}
                    {updateUser && (
                        <div className="overlay">
                            <UpdateUserForm
                                user={updateUser}
                                onClose={handleCloseUpdateForm}
                                onUpdate={handleUserUpdated} // Виклик функції
                            />
                        </div>
                    )}
                </div>
            </div>
            <Buttons />
        </div>
    );
}

export default Users;
