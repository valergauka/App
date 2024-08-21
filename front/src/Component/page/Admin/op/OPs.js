import { Link } from "react-router-dom";
import React, { useEffect, useState } from 'react';
import NET from '../../../../network';
import axios from 'axios';
import './OPs.css';
import Buttons from "../../../UIComponent/buttons/Buttons";
import FormDelete from "../../../UIComponent/formDelete/FormDelete";
import { FiFilePlus, FiTrash2 } from "react-icons/fi";

const OPs = () => {
    const [op, setOp] = useState([]);
    const [openFormDelete, setOpenFormDelete] = useState(false);
    const [idToDelete, setIdToDelete] = useState(null);
    const [suggestions, setSuggestions] = useState([]);
    const [text, setText] = useState('');

    useEffect(() => {
        const loadOp = async () => {
            try {
                const response = await axios.get(`${NET.APP_URL}/op`);
                setOp(response.data);
                setSuggestions(response.data);
            } catch (error) {
                console.error('Помилка завантаження списку операцій:', error);
            }
        };
        loadOp();
    }, []);

    const onSuggestHandler = (text) => {
        setText(text);
        setSuggestions(op.filter(elem => elem.speciality.includes(text)));
    };

    const handleSubmit = (id) => {
        setIdToDelete(id);
        setOpenFormDelete(true);
    };

    const handleDelete = async () => {
        try {
            await axios.delete(`${NET.APP_URL}/deleteOp`, { data: { id: idToDelete } });
            // Після успішного видалення оновлюємо список, видаляючи видалений елемент
            setOp(prevOp => prevOp.filter(item => item.id !== idToDelete));
            setSuggestions(prevSuggestions => prevSuggestions.filter(item => item.id !== idToDelete));
        } catch (error) {
            console.error('Помилка видалення операції:', error);
        }
        setOpenFormDelete(false); // Закриваємо форму після видалення
    };

    const onChangeHandler = (text) => {
        setText(text);
        setSuggestions(op.filter(elem => elem.speciality.includes(text)));
    };

    return (
        <div>
            <div className="butonAddOp">
                <Link to={'/addop'}>
                    <button>
                        <FiFilePlus />
                        <span>Додати ОП</span>
                    </button>
                </Link>
            </div>
            <div className='userTable'>
                <input className='inputSpec'
                    type="text"
                    name='search'
                    placeholder='Код та назва спеціальності'
                    onChange={e => onChangeHandler(e.target.value)}
                    value={text}
                />
                {openFormDelete && (
                    <FormDelete link='/op' text={"цю освітню пограму"} isOpen={openFormDelete} onClose={() => setOpenFormDelete(false)} onDelete={handleDelete} />
                )}
                <table>
                    <tbody>
                        <tr>
                            <th className='opBranch'>Галузь знань</th>
                            <th className='opSpeciality'>Спеціальність</th>
                            <th className='opSpecialisation'>Спеціалізація</th>
                            <th className='opName'>Освітня програма</th>
                        </tr>
                        {suggestions && suggestions.map(suggestion => (
                            <tr key={suggestion.id} className="trSp" onClick={() => onSuggestHandler(suggestion.speciality)}>
                                <td className="opBranch f-weight">{suggestion.branch}</td>
                                <td className='opSpeciality f-weight'>{suggestion.speciality}</td>
                                <td className='opSpecialisation f-weight'>
                                    {suggestion.specialisation === 'Не має спеціалізації' ? '' : suggestion.specialisation}
                                </td>
                                <td className='opName f-weight'>{suggestion.op}</td>
                                <td className='contact'><button className='contactCTA'><FiTrash2 onClick={() => handleSubmit(suggestion.id)} /></button></td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
            <Buttons />
        </div>
    );
}

export default OPs;
