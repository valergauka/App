import React, { useState } from 'react';
import axios from 'axios';
import NET from '../../network';
import { useHistory } from 'react-router-dom';
import { useAuth } from '../authContext/AuthContext';
import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import { MdVisibility, MdVisibilityOff, MdAlternateEmail, MdSupervisedUserCircle } from "react-icons/md";
import './RegistrationForm.css'

function RegistrationForm() {
    const [errorText, setErrorText] = useState('');
    const { login } = useAuth();
    const [classNameInput, setClassNameInput] = useState('invalidInputRegister');
    const [showPassword, setShowPassword] = useState(false);
    const [isInvalidData, setIsInvalidData] = useState(false);
    const [formData, setFormData] = useState({
        name: '',
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

    const history = useHistory();

    const handleSubmit = (e) => {
        e.preventDefault();
        axios
            .post(`${NET.APP_URL}/register`, formData)
            .then((response) => {
                if (response.status === 200) {
                    const { user, userGroup } = response.data;
                    login(user, userGroup);
                    history.push('/present');
                } else {
                    console.error(response.data);
                }
            })
            .catch((error) => {
                if (error.response && error.response.status === 400) {
                    // Отримали текст помилки з сервера
                    setErrorText(error.response.data.message);
                    setIsInvalidData(true);
                    setClassNameInput('invalidInputErrorRegister');
                } else {
                    console.error(error);
                    setErrorText('Сталася помилка при реєстрації');
                    setIsInvalidData(true);
                    setClassNameInput('invalidInputErrorRegister');
                }
            });
    };

    return (
        <div className='formRegister'>
            <div className="register">
                <div className="avatar">
                    <img src="logo.png" alt="Platform Logo" />
                </div>
                <h2>Реєстрація</h2>
                <h3>Вітаємо Вас на нашій платформі!</h3>
                <form className="register-form" >
                    <div className="textbox">
                        <div className='visibleRegistration'>
                            <MdSupervisedUserCircle />
                        </div>
                        <input type="text"
                            name="name"
                            value={formData.name}
                            onChange={handleChange}
                            required
                            className={classNameInput}
                            placeholder="Прізвище ім'я по-батькові" />
                    </div>
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
                            {showPassword ?
                                <MdVisibility /> :
                                <MdVisibilityOff />
                            }
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
                            {errorText}
                        </div>
                    )}
                    <button onClick={handleSubmit} type="submit">Зареєструватися</button>
                    <Link to={'/'} className="linkelogin">Я вже зареєстрований!</Link>
                </form>
            </div>
        </div>
    );
}

export default RegistrationForm;
