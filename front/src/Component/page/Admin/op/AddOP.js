import React from "react";
import { BsArrowLeftShort } from "react-icons/bs";
import { useState } from "react";
import { Link } from 'react-router-dom';
import Buttons from "../../../UIComponent/buttons/Buttons";
import NET from "../../../../network";

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
            speciality: speciality,
            specialisation: specialisation,
            op: op
        };
        console.log(formData);

        fetch(`${NET.APP_URL}/op`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(formData)
        })
        .then(response => {
          console.log(response.data);
          window.location.reload();
        })
        .catch(error => {
          console.error(error);
        });
       }

    return (
        <div>
            <div className="content">
                <div className="formMenuUser">
                    <Link to='/op' className='backOp' ><BsArrowLeftShort /></Link>
                    <h5 className="title">Add OP</h5>
                    <div className="group">
                        <input type='text' className="input" required='true' value={branch} onChange={(e) => setBranch(e.target.value)} />
                        <span className="highlight"></span>
                        <span className="bar"></span>
                        <label className="label">Name and ID branch</label>
                    </div>
                    <div className="group">
                        <input type='text' className="input" required='true' value={speciality} onChange={(e) => setSpeciality(e.target.value)} />
                        <span className="highlight"></span>
                        <span className="bar"></span>
                        <label className="label">Name and ID Speciality</label>
                    </div>
                    <div className="group">
                        <input type='text' className="input" required='true' value={specialisation} onChange={(e) => setSpecialisation(e.target.value )} />
                        <span className="highlight"></span>
                        <span className="bar"></span>
                        <label className="label">Name and ID Specialisation</label>
                    </div>
                    <div className="group">
                        <input type='text' className="input" required='true' value={op} onChange={(e) => setOp(e.target.value )} />
                        <span className="highlight"></span>
                        <span className="bar"></span>
                        <label className="label">Name and ID OP</label>
                    </div>
                    <div className="buttonAdd" onClick={handleSubmit}>
                        Add
                    </div>
                </div>
            </div>
            <Buttons />
        </div>
    );
}

export default AddOP;