import React, { useState } from 'react';
import axios from 'axios';
import NET from '../../network';
import { useHistory } from 'react-router-dom';
import './LoginForm.css';
import { useAuth } from '../authContext/AuthContext';
import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import { MdVisibility, MdVisibilityOff, MdAlternateEmail } from "react-icons/md";

function LoginForm() {
    const [isInvalidData, setIsInvalidData] = useState(false);
    const [showPassword, setShowPassword] = useState(false);
    const [classNameInput, setClassNameInput] = useState('invalidInput');
    const [formData, setFormData] = useState({
        email: '',
        password: '',
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData({
            ...formData,
            [name]: value,
        });
    };

    const history = useHistory(); // Отримайте об'єкт history
    const { login } = useAuth();

    const handleSubmit = (e) => {
        e.preventDefault();
        console.log(formData);
        axios
            .post(`${NET.APP_URL}/login`, formData)
            .then((response) => {
                if (response.status === 200) {
                    const { user, userGroup } = response.data;
                    login(user, userGroup);
                    history.push('/sign', { userGroup });
                }
            })
            .catch((error) => {
                console.error(error);
                setIsInvalidData(true);
                setClassNameInput('invalidInputError');
            });
    };

    return (
        <div className='formLogin'>
            <div className="login">
                <div className="avatar">
                    <img src="logo.png" alt="Логотип платформи" /> {/* Додано alt атрибут */}
                </div>
                <h2>Вхід</h2>
                <h3>Вітаємо Вас на нашій платформі!</h3>
                <form className="login-form">
                    <div className="textbox">
                        <div className='visibleRegistration'>
                            <MdAlternateEmail />
                        </div>
                        <input type="email"
                            name="email"
                            value={formData.email}
                            onChange={handleChange}
                            required
                            className={classNameInput}
                            placeholder="user@chnu.edu.ua" />
                    </div>
                    <div className="textbox">
                        <div className='visibleRegistration' onClick={() => setShowPassword(!showPassword)}>
                            {showPassword ? <MdVisibility /> : <MdVisibilityOff />}
                        </div>
                        <input type={showPassword ? "text" : "password"}
                            name="password"
                            value={formData.password}
                            onChange={handleChange}
                            required
                            className={classNameInput}
                            placeholder="Пароль" />
                    </div>
                    {isInvalidData && (
                        <div className="errorMessage">
                            Неправильні дані входу. Перевірте свої дані.
                        </div>
                    )}
                    <button onClick={handleSubmit} type="submit">Увійти</button>
                    <Link to={'/register'} className="linkeRegistr">Можливо хочете створити акаунт?</Link>
                </form>
            </div>
        </div>
    );
}

export default LoginForm;
