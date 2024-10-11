import React, { useState } from 'react';
import './ToggleButton.css';

function ToggleButton({ onToggle }) {
    const [isAll, setIsAll] = useState(false);

    const toggleButton = () => {
        setIsAll(prevState => !prevState);
        // Відправка 0 або 1 залежно від стану кнопки
        onToggle(isAll ? 0 : 1);
    };

    return (
        <button className={`toggle-button ${isAll ? 'active' : ''}`} onClick={toggleButton}>
            {isAll ? 'Мої':'Всі'}
        </button>
    );
}

export default ToggleButton;
