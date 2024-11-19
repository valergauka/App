import React, { useState } from "react";
import axios from "axios";
import './AddUser.css'
import Buttons from "../../../UIComponent/buttons/Buttons"
import NET from '../../../../network';
import { Link, useHistory } from "react-router-dom";
import { BsArrowLeftShort } from "react-icons/bs";

const AddUser = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [userRoles, setUserRoles] = useState([]); // Додали стейт для ролей користувача

  // Використовуємо useHistory замість useNavigate
  const history = useHistory();

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
      roles: userRoles, // Передаємо ролі користувача
    };

    axios.post(`${NET.APP_URL}/user`, formData)
      .then(response => {
        console.log('Користувача додано успішно:', response.data);
        // Після успішного додавання користувача виконуємо перенаправлення на "/users"
        history.push('/users');
      })
      .catch(error => {
        console.error('Помилка під час додавання користувача:', error);
      });
  };

  return (
    <div className="contentAddUser">
      <div className="formMenuUserAddUser">
        <Link to='/users' className='backOp' ><BsArrowLeftShort /></Link>
        <h5 className="titleAddUser">Додати користувача</h5>
        <form onSubmit={handleSubmit}>
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
            <div>
              <label className='roleItemFormUser'>
                Користувач
                <input
                  type="checkbox"
                  value={1}
                  checked={userRoles.includes(1)}
                  onChange={handleRoleChange}
                />
              </label>
            </div>
            <div>
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
          <button type="submit" className="buttonAddUser">
            Додати
          </button>
        </form>
      </div>
      <Buttons />
    </div>
  );
}

export default AddUser;
