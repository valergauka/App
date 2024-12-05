import React, { useState } from 'react';
import { BsArrowLeftShort } from "react-icons/bs";
import axios from 'axios';

import Header from "../../../UIComponent/Header";
import Commentar from '../../../UIComponent/comment/Commentar';
import ApproveOutput from '../../../ApproveInput/ApproveOutput';
import FileList from '../../../UIComponent/FileList/FileList';
import FormPdf from '..//Present/Form/FormPdf';
import Button from '../../../UIComponent/Button';
import NET from '../../../../network';
import './ReviewUserItem.css';

const ReviewUserItem = ({ cart, status, CloseCart, categoriesPdf }) => {
    const {
        approve,
        category,
        educLevel,
        nameOp,
        speciality,
        specialisation,
        branch,
        guarantor,
        structural,
        faculty,
        date,
        file: initialFiles, // Renamed to avoid conflict with state
    } = cart[0];
    const reviewId = Number(cart.map(el => el.id)[0]);

    const [showFileForm, setShowFileForm] = useState(false);
    const [files, setFiles] = useState(initialFiles); // State to manage file list

    const handleAddFilesClick = () => {
        setShowFileForm(true);
    };

    const handleBackClick = () => {
        setShowFileForm(false);
    };

    
    const handleSubmitReview = async () => {
        const data = { id: reviewId, statusId: 1 };

        try {
            const response = await axios.post(`${NET.APP_URL}/updateStatus`, data);
            console.log("Відповідь сервера:", response.data);

            // Перезавантаження сторінки після успішного оновлення
            window.location.reload();
        } catch (error) {
            console.error("Помилка при оновленні статусу:", error);

            // Відображення повідомлення для користувача
            alert("Не вдалося оновити статус. Спробуйте ще раз.");
        }
    };



    const handleFileDeleted = (deletedFileId) => {
        // Update file list state after a file is deleted
        setFiles(files.filter(file => file.id !== deletedFileId));
    };

    return (
        <div>
            <Header />
            {showFileForm ? (
                <div>
                    <div className="backCart" onClick={handleBackClick}>
                        <BsArrowLeftShort /> Назад
                    </div>
                    <FormPdf reviewId={reviewId} title={category.title} categories={categoriesPdf} />
                </div>
            ) : (
                <main className="mainCartsReview">
                    <div className="backCart" onClick={CloseCart}>
                        <BsArrowLeftShort />
                    </div>
                    <form className="cartForm">
                        <h2>{category.title}</h2>
                        <div>
                            <h5>Рівень: {educLevel}</h5>
                            <h5>Освітня програма: {nameOp}</h5>
                            <h5>Спеціальність: {speciality}</h5>
                            <h5>Спеціалізація: {specialisation}</h5>
                            <h5>Галузь знань: {branch}</h5>
                            <h5>Гарант програми: {guarantor}</h5>
                            <h5>Структурний підрозділ: {structural}</h5>
                            <h5>Факультет/Інститут: {faculty}</h5>
                            <h5>Дата подання: {date}</h5>
                        </div>
                        <FileList
                            categories={categoriesPdf}
                            handleAddFilesClick={handleAddFilesClick}
                            status={status}
                            files={files} // Pass the current state of files
                            onFileDeleted={handleFileDeleted} // Pass the handler to remove a file
                        />
                            {status === 4 && (
                                <div onClick={handleSubmitReview}>
                                    <Button title="Подати до розгляду" />
                                </div>
                            )}

                    </form>

                    {status !== 4 && (
                        <div>
                            <div className="outputApprove">
                                <ApproveOutput approve={approve} />
                            </div>
                            <Commentar idReview={reviewId} />
                        </div>
                    )}
                </main>
            )}
        </div>
    );
};

export default ReviewUserItem;
