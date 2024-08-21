import { Link } from "@react-pdf/renderer";
import React, { useState } from "react";
import Button from "../../../../../../UIComponent/Button";
import axios from 'axios'; 
import NET from "../../../../../../../network";

const ApproveEdit = (props) => {
    const [formData, setFormData] = useState({
        id: props.approve[0].id,
        committeMNDate: props.approve[0].committeMNDate || '',
        committeMNNumber: props.approve[0].committeMNNumber || 0,
        committeSCDate: props.approve[0].committeSCDate || '',
        committeSCNumber: props.approve[0].committeSCNumber || 0,
        orderDate: props.approve[0].orderDate || '',
        orderNumber: props.approve[0].orderNumber || 0,
        resolution: props.approve[0].resolution || '',
        review_id: props.approve[0].review_id,
    });

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        if (typeof formData === 'object') { // Переконатися, що formData є об'єктом
            setFormData({ ...formData, [name]: value });
        }
    };

    
    const handleSubmit = (event, formData) => {
        //event.preventDefault();
        axios.post(`${NET.APP_URL}/updateApprove`, { formData })
            .then((response) => {
                // Обробка успішної відповіді від сервера, якщо потрібно
                console.log(response.data);
            })
            .catch((error) => {
                // Обробка помилки, якщо є
                console.error(error);
            });
    };




    return (
        <div className='aprover'>
            <h3>{props.categoryTitle}</h3>
            <form className='formAppApprove' onSubmit={(event) => handleSubmit(event, formData)}>

                <div className='cartNumApprove'>
                    <label className='labelApproveApprove'>Протокол засідання Комісії</label>
                    <div className='date-numApprove'>
                        <input
                            type='date'
                            name='committeMNDate'
                            lang="uk"
                            value={formData.committeMNDate}
                            onChange={handleInputChange}
                        />
                        <input
                            type='number'
                            min={1}
                            placeholder='Номер'
                            lang="uk"
                            name='committeMNNumber'
                            value={formData.committeMNNumber}
                            onChange={handleInputChange}
                        />
                    </div>
                </div>
                <div className='cartNumApprove'>
                    <label className='labelApproveApprove'>Протокол засідання Вченої ради</label>
                    <div className='date-numApprove'>
                        <input
                            type='date'
                            name='committeSCDate'
                            lang="uk"
                            value={formData.committeSCDate}
                            onChange={handleInputChange}
                        />
                        <input
                            type='number'
                            min={1}
                            placeholder='Номер'
                            lang="uk"
                            name='committeSCNumber'
                            value={formData.committeSCNumber}
                            onChange={handleInputChange}
                        />
                    </div>
                </div>
                <div className='cartNumApprove'>
                    <label className='labelApproveApprove'>Наказ про утвердження</label>
                    <div className='date-numApprove'>
                        <input
                            type='date'
                            name='orderDate'
                            lang="uk"
                            value={formData.orderDate}
                            onChange={handleInputChange}
                            placeholder='Виберіть дату'
                        />
                        <input
                            type='number'
                            min={1}
                            placeholder='Номер'
                            lang="uk"
                            name='orderNumber'
                            value={formData.orderNumber}
                            onChange={handleInputChange}
                        />
                    </div>
                </div>
            </form>
            <label className='labelOnApprove'>Ухвала комісії </label>
            <div>
                <textarea
                    className='comentFormApprove'
                    name='resolution'
                    value={formData.resolution}
                    onChange={handleInputChange}
                ></textarea>
            </div>
            <div className='buttonAppApprove' >
                <button className="buttonAppApproveForm" onClick={(event) => handleSubmit(event, formData)}>Зміники</button>
            </div>
        </div>
    );
}

export default ApproveEdit;
