// Logout.js
import React from 'react';
import { useHistory } from 'react-router-dom';
import { useAuth } from './AuthContext';

const Logout = () => {
    const { logout } = useAuth();
    const history = useHistory();

    const handleLogout = () => {
        if (user) { // Перевірка, чи є користувач
            logout();
            history.push('/'); // Перенаправлення на сторінку після виходу
        }
    };


    return (
        <div>
            <h2>Logout</h2>
            <button onClick={handleLogout}>Logout</button>
        </div>
    );
};

export default Logout;
