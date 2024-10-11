import React, { createContext, useContext, useState, useEffect, useCallback, useRef } from 'react';
import { useHistory } from 'react-router-dom';

const AuthContext = createContext();

export function AuthProvider({ children }) {
    const [user, setUser] = useState(null);
    const [userGroup, setUserGroup] = useState([]);
    const history = useHistory();
    const sessionTimeout = 30 * 60 * 1000; // 30 хвилин
    const logoutTimerRef = useRef(null); // Використання useRef для зберігання таймеру

    const login = (userData, groupData) => {
        setUser(userData);
        setUserGroup(groupData);
        localStorage.setItem('user', JSON.stringify(userData));
        localStorage.setItem('userGroup', JSON.stringify(groupData));
    };

    const logout = useCallback(() => {
        setUser(null);
        setUserGroup([]);
        localStorage.removeItem('user');
        localStorage.removeItem('userGroup');
        history.push('/');
    }, [history]);

    const resetSessionTimeout = useCallback(() => {
        clearTimeout(logoutTimerRef.current);
        logoutTimerRef.current = setTimeout(logout, sessionTimeout);
    }, [logout, sessionTimeout]);

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
            setUserGroup([]); // Ініціалізуємо пустий масив, якщо дані відсутні
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
            clearTimeout(logoutTimerRef.current); // Очищення таймеру при демонтажі компонента
        };
    }, [resetSessionTimeout]);

    return (
        <AuthContext.Provider value={{ user, userGroup, login, logout }}>
            {children}
        </AuthContext.Provider>
    );
}

export function useAuth() {
    return useContext(AuthContext);
}
