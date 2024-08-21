import React from "react";
import { BsArrowLeftShort } from "react-icons/bs";
import { useState } from "react";
import { Link } from 'react-router-dom';
import Buttons from "../../../UIComponent/buttons/Buttons";
import NET from "../../../../network";
import axios from "axios";

import './AddOP.css';

const AddOP = () => {

    const [branch, setBranch] = useState('');
    const [speciality, setSpeciality] = useState('');
    const [specialisation, setSpecialisation] = useState('');
    const [op, setOp] = useState('');

    const handleSubmit = (event) => {
        event.preventDefault();
        const formData = {
            branch: branch,
            speciality: speciality ,
            specialisation: specialisation || 'Не має спеціалізації',
            op: op
        };
        //console.log(formData);

        axios
            .post(`${NET.APP_URL}/createOp`, formData)
            .then((response) => {
                // Handle the response here, e.g., display a success message
                console.log(response.data);
            })
            .catch((error) => {
                // Handle errors, e.g., display an error message
                console.error(error);
            });
    }

    return (
        <div>
            <div className="content">
                <div className="formMenuUser">
                    <Link to='/op' className='backOp' ><BsArrowLeftShort /></Link>
                    <h5 className="title">Додати ОП</h5>
                    <div className="group">
                        <input type='text' className="input" value={branch} onChange={(e) => setBranch(e.target.value)} />
                        <span className="highlight"></span>
                        <span className="bar"></span>
                        <label className="label">ID та назва Галузі знань</label>
                    </div>
                    <div className="group">
                        <input type='text' className="input" value={speciality} onChange={(e) => setSpeciality(e.target.value)} />
                        <span className="highlight"></span>
                        <span className="bar"></span>
                        <label className="label">ID та назва Спеціальності</label>
                    </div>
                    <div className="group">
                        <input type='text' className="input" value={specialisation} onChange={(e) => setSpecialisation(e.target.value)} />
                        <span className="highlight"></span>
                        <span className="bar"></span>
                        <label className="label">ID та назва Спеціалізації (якщо вона є)</label>
                    </div>
                    <div className="group">
                        <input type='text' className="input" value={op} onChange={(e) => setOp(e.target.value)} />
                        <span className="highlight"></span>
                        <span className="bar"></span>
                        <label className="label">ID та назва Освітньої програми</label>
                    </div>
                    <div className="buttonAdd" onClick={handleSubmit}>
                        <Link to={'/op'}>
                            Додати
                        </Link>
                    </div>
                </div>
            </div>
            <Buttons />
        </div>
    );
}

export default AddOP;