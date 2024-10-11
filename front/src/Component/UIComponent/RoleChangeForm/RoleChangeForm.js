import React, { useState, useEffect } from 'react';
import './RoleChangeForm.css';
import axios from 'axios';
import NET from '../../../network';

function RoleChangeForm(props) {
    const [userRoles, setUserRoles] = useState([]);

    useEffect(() => {
        axios.post(`${NET.APP_URL}/users/groups`, { id: props.userId })
            .then(response => {
                setUserRoles(response.data.map(role => role.id));
            })
            .catch(error => {
                console.error('Помилка при отриманні груп користувача', error);
            });
    }, [props.userId]);

    const handleRoleChange = (event) => {
        const roleId = parseInt(event.target.value);
        if (userRoles.includes(roleId)) {
            setUserRoles(userRoles.filter(role => role !== roleId));
        } else {
            setUserRoles([...userRoles, roleId]);
        }
    };

    const handleSubmit = (event) => {
        event.preventDefault();
        axios.post(`${NET.APP_URL}/users/groups/edit`, { id: props.userId, roles: userRoles })
            .then(response => {
                console.log(response.data);
                props.openFormRole(false); // Close the role change form
                window.location.reload(); // Reload the page
            })
            .catch(error => {
                console.error('Помилка при зміні ролей користувача', error);
            });
    };

    return (
        <form onSubmit={handleSubmit}>
            <div className='roleChangeForm'>
                <div className='roleItem'>
                    <label>
                        Користувач
                        <input
                            type="checkbox"
                            value={1}
                            checked={userRoles.includes(1)}
                            onChange={handleRoleChange}
                        />
                    </label>
                </div>
                <div className='roleItem'>
                    <label>
                        Комісія
                        <input
                            type="checkbox"
                            value={2}
                            checked={userRoles.includes(2)}
                            onChange={handleRoleChange}
                        />
                    </label>
                </div>
                <div className='roleItem'>
                    <label>
                        Адміністратор
                        <input
                            type="checkbox"
                            value={3}
                            checked={userRoles.includes(3)}
                            onChange={handleRoleChange}
                        />
                    </label>
                </div>
            </div>
            <button className='buttonRole' type="submit">Змінити ролі</button>
        </form>
    );
}

export default RoleChangeForm;
