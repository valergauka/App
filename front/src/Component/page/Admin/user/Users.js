import Buttons from "../../../UIComponent/buttons/Buttons";
import React, { useState, useEffect } from "react";
import { GoX } from "react-icons/go";
import NET from '../../../../network';
import axios from 'axios';

import './Users.css';

const Users = (props) => {
    const [users, setUsers] = useState([]);

    useEffect(() => {
        const loadUsers = async () => {
            const response = await axios.get(`${NET.APP_URL}/user`);
            setUsers(response.data)
        }
        loadUsers();
    }, [])

    console.log(users);

    return (
        <div>
            <h2 className="title">Комісія</h2>
            <div className="usersCarts">
                {
                    users.map(el => (
                        <div className="userCart">
                            <GoX className="deliteUser" onClick={() => props.onDelete(el.id)}/>
                           <p><b>Ім'я: &nbsp;</b>{el.name}</p>
                           <p><b>Email: &nbsp;</b><a href={`mailto: ${el.email}`}>{el.email}</a></p>
                           <p><b>Посада: &nbsp;</b>{el.position}</p>
                        </div>
                    ))
                }
            </div>
            <Buttons />
        </div>
    );
}

export default Users;