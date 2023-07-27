import React from "react";
import './AddUser.css'
import Buttons from "../../../UIComponent/buttons/Buttons"
import { useState } from "react";
import NET from '../../../../network';

const AddUser = () => {
    
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [position, setPosition] = useState('');

    const handleSubmit = (event) => {
      event.preventDefault();
        const formData = {
          name: name,
          email: email,
          password: password,
          position: position
        };
        console.log(formData);

        fetch(`${NET.APP_URL}/user`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(formData)
        })
        .then(response => {
          console.log(response.data);
        })
        .catch(error => {
          console.error(error);
        });
        window.location.reload();
       }
    return (
        <div className="contentAddUser">
            <div className="formMenuUserAddUser">
                <h5 className="titleAddUser">Додати користувача</h5>
                <div className="groupAddUser">
                    <input type='text' className="inputAddUser"  value={name} onChange={(e) => setName(e.target.value)} />
                    <span className="highlightAddUser"></span>
                    <span className="barAddUser"></span>
                    <label className="labelAddUser">Ім'я</label>
                </div>
                <div className="groupAddUser">
                    <input type='email' className="inputAddUser"  value={email} onChange={(e) => setEmail(e.target.value)} />
                    <span className="highlightAddUser"></span>
                    <span className="barAddUser"></span>
                    <label className="labelAddUser">Email</label>
                </div>
                <div className="groupAddUser">
                    <input type='password' className="inputAddUser" value={password} onChange={(e) => setPassword(e.target.value)}/>
                    <span className="highlightAddUser"></span>
                    <span className="barAddUser"></span>
                    <label className="labelAddUser">Пароль</label>
                </div>
                <div className="groupAddUser">
                    <input type='text' className="inputAddUser" value={position} onChange={(e) => setPosition(e.target.value)}/>
                    <span className="highlightAddUser"></span>
                    <span className="barAddUser"></span>
                    <label className="labelAddUser">Посада користувача</label>
                </div>
                <div className="buttonAddUser" onClick={handleSubmit}>
                   Додати
                </div>
            </div>
            <Buttons />
        </div>
    );
}

export default AddUser;