import React, { useState } from "react";
import './Input.css';

const Input = (props) => {
    const [suggestions, setSuggestions] = useState([]);
    const [text, setText] = useState('');

    const onSuggestHandler = (suggestion) => {
        setText(suggestion);
        setSuggestions([]);
        props.setValue(suggestion);
    }

    const onChangeHandler = (inputText) => {
        let matches = [];

        // Перевіряємо, чи існує arrayData і чи є він масивом
        if (props.arrayData && Array.isArray(props.arrayData) && inputText.length > 0) {
            matches = props.arrayData.filter(elem => {
                const regex = new RegExp(`${inputText}`, 'gi');
                return elem.match(regex);
            });
        }

        setSuggestions(matches);
        setText(inputText);
        props.setValue(inputText);
    }

    return (
        <div>
            <input
                className='inputText'
                type="text"
                name={props.nameInput}
                required
                placeholder={props.placeholderInput}
                onChange={e => onChangeHandler(e.target.value)}
                value={text}
            />
            {suggestions.length > 0 && (
                <div className="cart">
                    {suggestions.map((suggestion, index) => (
                        <div
                            key={index} // Унікальний ключ для кожного елемента
                            className='suggestion'
                            onClick={() => onSuggestHandler(suggestion)}
                        >
                            {suggestion}
                        </div>
                    ))}
                </div>
            )}
        </div>
    );
}

export default Input;
