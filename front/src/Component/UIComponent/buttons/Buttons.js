import { useState } from 'react';
import { FiFileText, FiUsers, FiPlus, FiFile } from "react-icons/fi";
import { Link } from 'react-router-dom';

import './Buttons.css';


const Buttons = () => {
    const [isOpen, setIsOpen] = useState(false);

    return (
        <div className='bacbut'>
            <div className={`fab ${isOpen ? 'open' : ''}`}>
                <button onClick={() => setIsOpen(!isOpen)}>
                    <FiPlus />
                </button>
                <div className='menu'>
                    <Link to={'/op'}>
                        <button>
                            <FiFile />
                            <span>Освітні програми</span>
                        </button>
                    </Link>

                    <Link to={'/program'}>
                        <button>
                            <FiFileText />
                            <span>Подані заявки</span>
                        </button>
                    </Link>
                    <Link to={'/users'}>
                        <button>
                            <FiUsers />
                            <span>Користувачі</span>
                        </button>
                    </Link>
                    

                </div>
            </div>
        </div>

    );
}

export default Buttons;