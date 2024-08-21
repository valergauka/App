import React from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../../Sign/authContext/AuthContext';
import Button from '../Button';
import './LogHeader.css';
import { BiLogOut } from "react-icons/bi";
import { useHistory } from 'react-router-dom';
import NET from '../../../network';
import axios from 'axios';
import { useState } from 'react';
import { FiAlignJustify } from "react-icons/fi";
import { GrHomeRounded } from "react-icons/gr";



function LogHeader() {
    const { user, logout, userGroup } = useAuth();
    const history = useHistory();
    const [isOpen, setIsOpen] = useState(false);

    const handleLogout = () => {
        setIsOpen(false)
        axios
            .post(`${NET.APP_URL}/logout`, { token: user.token })
            .then((response) => {
                if (response.status === 200) {
                    axios
                        .post(`${NET.APP_URL}/logout`)
                        .then(() => {
                            logout();
                            history.push('/');
                        })
                        .catch((error) => {
                            console.error('Помилка під час виходу:', error);
                        });
                } else {
                    console.error('Перевірка перед виходом не пройшла.');
                }
            })
            .catch((error) => {
                console.error('Помилка під час перевірки перед виходом:', error);
            });
    };

    const handleHome = () => {
        setIsOpen(false)
        history.push('/sign', { userGroup });
    }

    return (
        <header>
            <nav>
                {user ? (
                    <div className="user-info-icons">
                        {
                            userGroup.length === 1 &&
                            <div onClick={handleLogout}>
                                <BiLogOut className="user-info-icon-logout-sign" />
                            </div>
                        }{userGroup.length > 1 &&
                            <div className={`butt ${isOpen ? 'open' : ''}`}>
                                <button onClick={() => setIsOpen(!isOpen)}>
                                    <FiAlignJustify className="user-info-icon" />
                                </button>
                                <div className='menuButt'>
                                    <div onClick={handleLogout} className='menu-item'>
                                        <BiLogOut className="user-info-icon-logout" />
                                        <h3>Вийти із системи</h3>
                                    </div>

                                    <div onClick={handleHome} className='menu-item'>
                                        <GrHomeRounded className="user-info-icon-home" />
                                        <h3>Головна сторінка</h3>
                                    </div>
                                </div>
                            </div>
                        }
                    </div>
                ) : (
                    <div className="user-info">
                    </div>
                )}
            </nav>
        </header>
    );
}

export default LogHeader;
