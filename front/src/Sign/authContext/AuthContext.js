import React, { createContext, useContext, useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';

const AuthContext = createContext();

export function AuthProvider({ children }) {
    const [user, setUser] = useState(null);
    const [userGroup, setUserGroup] = useState([]);
    const history = useHistory();
    const sessionTimeout = 30 * 60 * 1000; // 30 хвилин
    let logoutTimer;

    const login = (userData, groupData) => {
        setUser(userData);
        setUserGroup(groupData);
        localStorage.setItem('user', JSON.stringify(userData));
        localStorage.setItem('userGroup', JSON.stringify(groupData));
    };

    const logout = () => {
        setUser(null);
        setUserGroup([]);
        localStorage.removeItem('user');
        localStorage.removeItem('userGroup');
        history.push('/');
    };

    const resetSessionTimeout = () => {
        clearTimeout(logoutTimer);
        logoutTimer = setTimeout(logout, sessionTimeout);
    };

    useEffect(() => {
        const storedUser = localStorage.getItem('user');
        if (storedUser) {
            try {
                setUser(JSON.parse(storedUser));
            } catch (error) {
                console.error('Помилка розпарсення даних користувача з LocalStorage', error);
            }
        }

        const storedUserGroup = localStorage.getItem('userGroup');
        if (storedUserGroup) {
            try {
                setUserGroup(JSON.parse(storedUserGroup));
            } catch (error) {
                console.error('Помилка розпарсення даних групи з LocalStorage', error);
            }
        } else {
            // Якщо дані групи відсутні в LocalStorage, ініціалізуйте їх пустим масивом чи об'єктом за замовчуванням.
            setUserGroup([]);
        }

        resetSessionTimeout();

        const eventListener = () => {
            resetSessionTimeout();
        };

        document.addEventListener('mousemove', eventListener);
        document.addEventListener('keydown', eventListener);

        return () => {
            document.removeEventListener('mousemove', eventListener);
            document.removeEventListener('keydown', eventListener);
            clearTimeout(logoutTimer);
        };
    }, []);


    return (
        <AuthContext.Provider value={{ user, userGroup, login, logout }}>
            {children}
        </AuthContext.Provider>
    );
}

export function useAuth() {
    return useContext(AuthContext);
}
