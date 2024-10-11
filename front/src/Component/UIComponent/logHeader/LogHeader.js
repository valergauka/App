import React, { useState } from 'react';
import { Link, useHistory } from 'react-router-dom';
import { useAuth } from '../../../Sign/authContext/AuthContext';
import { BiLogOut } from "react-icons/bi";
import { FiAlignJustify } from "react-icons/fi";
import { GrHomeRounded } from "react-icons/gr";
import axios from 'axios';
import NET from '../../../network';
import './LogHeader.css';

const MenuItem = ({ icon, label, onClick }) => (
    <div onClick={onClick} className='menu-item'>
        {icon}
        <h3>{label}</h3>
    </div>
);

function LogHeader() {
    const { user, logout, userGroup } = useAuth();
    const history = useHistory();
    const [isOpen, setIsOpen] = useState(false);

    const handleLogout = async () => {
        setIsOpen(false);
        try {
            const response = await axios.post(`${NET.APP_URL}/logout`, { token: user.token });
            if (response.status === 200) {
                logout();
                history.push('/');
            } else {
                console.error('Logout verification failed.');
            }
        } catch (error) {
            console.error('Error during logout:', error);
        }
    };

    const handleHome = () => {
        setIsOpen(false);
        history.push('/sign', { userGroup });
    };

    return (
        <header>
            <nav>
                {user ? (
                    <div className="user-info-icons">
                        {userGroup.length === 1 ? (
                            <div onClick={handleLogout}>
                                <BiLogOut className="user-info-icon-logout-sign" />
                            </div>
                        ) : (
                            <div className={`butt ${isOpen ? 'open' : ''}`}>
                                <button onClick={() => setIsOpen(prev => !prev)}>
                                    <FiAlignJustify className="user-info-icon" />
                                </button>
                                <div className='menuButt'>
                                    <MenuItem
                                        icon={<BiLogOut className="user-info-icon-logout" />}
                                        label="Вийти із системи"
                                        onClick={handleLogout}
                                    />
                                    <MenuItem
                                        icon={<GrHomeRounded className="user-info-icon-home" />}
                                        label="Головна сторінка"
                                        onClick={handleHome}
                                    />
                                </div>
                            </div>
                        )}
                    </div>
                ) : (
                    <div className="user-info"></div>
                )}
            </nav>
        </header>
    );
}

export default LogHeader;
