import React, { useState, useEffect } from "react";
import { BsArrowLeftShort } from "react-icons/bs";
import { Link } from 'react-router-dom';
import Buttons from "../../../UIComponent/buttons/Buttons";
import NET from "../../../../network";
import axios from "axios";
import Input from "../../User/Present/Form/FormInput/Input";

import './AddOP.css';

const AddOP = () => {
    const [branch, setBranch] = useState('');
    const [speciality, setSpeciality] = useState('');
    const [specialisation, setSpecialisation] = useState('');
    const [op, setOp] = useState('');
    const [opData, setOpData] = useState([]);

    useEffect(() => {
        const loadOpData = async () => {
            const response = await axios.get(`${NET.APP_URL}/op`);
            setOpData(response.data);
        };
        loadOpData();
    }, []);

    const unique = (arr) => {
        return [...new Set(arr)];
    };

    const branchOut = unique(opData.map(el => el.branch));
    const specialityOut = unique(opData.filter(el => el.branch === branch).map(el => el.speciality));
    const specialisationOut = unique(opData.filter(el => el.speciality === speciality).map(el => el.specialisation));

    const handleSubmit = (event) => {
        event.preventDefault();
        const formData = {
            branch: branch,
            speciality: speciality,
            specialisation: specialisation || 'Не має спеціалізації',
            op: op
        };

        axios
            .post(`${NET.APP_URL}/createOp`, formData)
            .then((response) => {
                console.log(response.data);
            })
            .catch((error) => {
                console.error(error);
            });
    };

    // Визначення, чи потрібно відображати поле спеціалізації для вибраної спеціальності
    const shouldDisplaySpecialisation = speciality === '014 Середня освіта' ||
        speciality === '015 Професійна освіта' ||
        speciality === '035 Філологія' ||
        (speciality === '227' && branch === 'Магістр');

    return (
        <div>
            <div className="content">
                <div className="formMenuUser">
                    <Link to='/op' className='backOp'><BsArrowLeftShort /></Link>
                    <h5 className="title">Додати ОП</h5>

                    <div className="group">
                        <label className="labelform">Галузь знань</label>
                        <Input
                            nameInput='branch'
                            placeholderInput="Виберіть галузь знань"
                            arrayData={branchOut}
                            value={branch}
                            setValue={setBranch}
                        />
                        
                    </div>

                    <div className="group">
                        <label className="labelform">Спеціальність</label>
                        <Input
                            nameInput='speciality'
                            placeholderInput="Виберіть спеціальність"
                            arrayData={specialityOut}
                            value={speciality}
                            setValue={setSpeciality}
                        />
                        
                    </div>

                    {shouldDisplaySpecialisation && (
                        <div className="group">
                            <label className="labelform">Спеціалізація</label>
                            <Input
                                nameInput='specialisation'
                                placeholderInput="Виберіть спеціалізацію (якщо є)"
                                arrayData={specialisationOut}
                                value={specialisation}
                                setValue={setSpecialisation}
                            />
                            
                        </div>
                    )} 

                    <div className="group">
                        <label className="labelform">Освітня програма</label>
                        <input
                            type='text'
                            className="input"
                            value={op}
                            onChange={(e) => setOp(e.target.value)}
                            placeholder="Введіть ID та назву Освітньої програми"
                        />
                        
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
