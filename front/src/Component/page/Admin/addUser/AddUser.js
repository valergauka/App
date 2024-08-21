import React, { useState } from "react";
import axios from "axios";
import './AddUser.css'
import Buttons from "../../../UIComponent/buttons/Buttons"
import NET from '../../../../network';
import { Link } from "react-router-dom";
import { BsArrowLeftShort } from "react-icons/bs";

const AddUser = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [position, setPosition] = useState('');
  const [userRoles, setUserRoles] = useState([]); // Додали стейт для ролей користувача

  const handleRoleChange = (event) => {
    const roleId = parseInt(event.target.value, 10);
    if (event.target.checked) {
      setUserRoles([...userRoles, roleId]);
    } else {
      setUserRoles(userRoles.filter((id) => id !== roleId));
    }
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    const formData = {
      name: name,
      email: email,
      password: password,
      position: position,
      roles: userRoles, // Передаємо ролі користувача
    };

    axios.post(`${NET.APP_URL}/user`, formData)
      .then(response => {
        console.log('Користувача додано успішно:', response.data);
        // Додайте код для відображення повідомлення про успішне додавання користувача
      })
      .catch(error => {
        console.error('Помилка під час додавання користувача:', error);
        // Додайте код для відображення повідомлення про помилку користувачу
      });
  };

  return (
    <div className="contentAddUser">
      <div className="formMenuUserAddUser">
        <Link to='/users' className='backOp' ><BsArrowLeftShort /></Link>
        <h5 className="titleAddUser">Додати користувача</h5>
        <div className="groupAddUser">
          <input type='text' className="inputAddUser" value={name} onChange={(e) => setName(e.target.value)} />
          <span className="highlightAddUser"></span>
          <span className="barAddUser"></span>
          <label className="labelAddUser">Прізвище, ім'я, по батькові</label>
        </div>
        <div className="groupAddUser">
          <input type='email' className="inputAddUser" value={email} onChange={(e) => setEmail(e.target.value)} />
          <span className="highlightAddUser"></span>
          <span className="barAddUser"></span>
          <label className="labelAddUser">Email (@chnu.edu.ua)</label>
        </div>
        <div className="groupAddUser">
          <input type='password' className="inputAddUser" value={password} onChange={(e) => setPassword(e.target.value)} />
          <span className="highlightAddUser"></span>
          <span className="barAddUser"></span>
          <label className="labelAddUser">Пароль</label>
        </div>
        <div className='roleChangeFormUser'>
          <div >
            <label className='roleItemFormUser'>
              Користувач
              <input
                type="checkbox"
                value={1}
                checked={userRoles.includes(1)} // Визначаємо, чи вибраний чекбокс
                onChange={handleRoleChange}
              />
            </label>
          </div>
          <div >
            <label className='roleItemFormUser'>
              Комісія
              <input
                type="checkbox"
                value={2}
                checked={userRoles.includes(2)}
                onChange={handleRoleChange}
              />
            </label>
          </div>
          <div>
            <label className='roleItemFormUser'>
              Адміністратор
              <input
                type="checkbox"
                value={3}
                checked={userRoles.includes(3)}
                onChange={handleRoleChange}
              />
            </label>
          </div>
        </div>
        <div className="buttonAddUser" onClick={handleSubmit}>
          <Link to={'/users'}>
            Додати
          </Link>
        </div>
      </div>
      <Buttons />
    </div>
  );
}

export default AddUser;
