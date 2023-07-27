import { Link } from "react-router-dom";
import { FiFilePlus } from "react-icons/fi";
import React, { useEffect, useState } from 'react';
import NET from '../../../../network';
import axios from 'axios';
import './OPs.css';
import Buttons from "../../../UIComponent/buttons/Buttons";
import { FiTrash2 } from "react-icons/fi";

const OPs = (props) => {
    const [op, setOp] = useState([]);

    useEffect(() => {
        const loadOp = async () => {
            const response = await axios.get(`${NET.APP_URL}/op`);
            setOp(response.data)
        }
        loadOp();
    }, [])


    const [suggestions, setSuggestions] = useState(op)
    const [text, setText] = useState('');

    const onSuggestHandler = (text) => {
        setText(text);
        setSuggestions(op);
    }

    const onChangeHandler = (text) => {
        let matches = op;
        if (text.length > 0) {
            matches = op.filter(elem => {
                const regex = new RegExp(`${text}`, 'gi')
                return (elem.speciality.match(regex))
            })
        }
        setSuggestions(matches)
        setText(text)
    }

    return (
        <div>
            <div className="iconAddOP">
                <Link to={'/addop'}>
                    <FiFilePlus />
                </Link>
            </div>
            <div className='userTable'>
                <input className='inputSpec'
                    type="text"
                    name='search'
                    placeholder='name Speciality'
                    onChange={e => onChangeHandler(e.target.value)}
                    value={text}
                />

                <table>
                    <tr>
                        <th className='opBranch'>Галузь знань</th>
                        <th className='opSpeciality'>Спеціальність</th>
                        <th className='opSpecialisation'>Спеціалізація</th>
                        <th className='opName'>Освітня програма</th>
                    </tr>

                    {suggestions && suggestions.map((suggestions) =>
                        <div
                            onClick={() => onSuggestHandler(suggestions.speciality)}
                        >
                            <tr className="trSp">
                                <td className="opBranch f-weight">{suggestions.branch}</td>
                                <td className='opSpeciality f-weight'>{suggestions.speciality}</td>
                                <td className='opSpecialisation f-weight'>{suggestions.specialisation}</td>
                                <td className='opName f-weight'>{suggestions.op}</td>
                                <td className='contact'><button className='contactCTA'><FiTrash2 onClick={() => props.onDelete(suggestions.id)}/></button></td>
                            </tr>
                        </div>
                    )}
                </table>

            </div>
            <Buttons />
        </div>
    );
}

export default OPs;