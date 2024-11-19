import React, { useState } from "react";
import axios from 'axios';
import NET from "../../../../../../../network";
import './ApproveEdit.css';

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
        setFormData({ ...formData, [name]: value });
    };

    const handleSubmit = (event) => {
        event.preventDefault();

        axios.post(`${NET.APP_URL}/updateApprove`, formData)
            .then((response) => {
                window.location.reload();
            })
            .catch((error) => {
                window.location.reload();
            });
    };

    return (
        <div className="approve-edit-container">
            <h3 className="approve-edit-title">{props.categoryTitle}</h3>
            <form className="approve-edit-form" onSubmit={handleSubmit}>

                <div className="approve-edit-section">
                    <label className="approve-edit-label">Протокол засідання Комісії</label>
                    <div className="approve-edit-inputs">
                        <input
                            type="date"
                            name="committeMNDate"
                            lang="uk"
                            value={formData.committeMNDate}
                            onChange={handleInputChange}
                            className="approve-edit-date"
                        />
                        <input
                            type="number"
                            min={1}
                            placeholder="Номер"
                            lang="uk"
                            name="committeMNNumber"
                            value={formData.committeMNNumber}
                            onChange={handleInputChange}
                            className="approve-edit-number"
                        />
                    </div>
                </div>

                <div className="approve-edit-section">
                    <label className="approve-edit-label">Протокол засідання Вченої ради</label>
                    <div className="approve-edit-inputs">
                        <input
                            type="date"
                            name="committeSCDate"
                            lang="uk"
                            value={formData.committeSCDate}
                            onChange={handleInputChange}
                            className="approve-edit-date"
                        />
                        <input
                            type="number"
                            min={1}
                            placeholder="Номер"
                            lang="uk"
                            name="committeSCNumber"
                            value={formData.committeSCNumber}
                            onChange={handleInputChange}
                            className="approve-edit-number"
                        />
                    </div>
                </div>

                <div className="approve-edit-section">
                    <label className="approve-edit-label">Наказ про утвердження</label>
                    <div className="approve-edit-inputs">
                        <input
                            type="date"
                            name="orderDate"
                            lang="uk"
                            value={formData.orderDate}
                            onChange={handleInputChange}
                            className="approve-edit-date"
                            placeholder="Виберіть дату"
                        />
                        <input
                            type="number"
                            min={1}
                            placeholder="Номер"
                            lang="uk"
                            name="orderNumber"
                            value={formData.orderNumber}
                            onChange={handleInputChange}
                            className="approve-edit-number"
                        />
                    </div>
                </div>

                <div className="approve-edit-section">
                    <label className="approve-edit-resolution-label">Ухвала комісії</label>
                    <textarea
                        className="approve-edit-textarea"
                        name="resolution"
                        value={formData.resolution}
                        onChange={handleInputChange}
                    />
                </div>

                <div>
                    <button className="approve-edit-button" type="submit">Зміни</button>
                </div>
            </form>
        </div>
    );
}

export default ApproveEdit;
