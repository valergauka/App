import React, { useState, useEffect, useCallback } from 'react';
import './Review.css';
import ReviewItems from './reviewItem/ReviewItems';
import axios from 'axios';
import axiosRateLimit from 'axios-rate-limit';
import NET from '../../../../network';
import CategoryDialog from '../../../UIComponent/CategoryDialog/CategoryDialog';
import MonthYearPicker from '../../../UIComponent/MonthYearPicker/MonthYearPicker';
import PDFGenerator from '../../../UIComponent/PDFGenerator/PDFGenerator';
import { GrDocumentPdf, GrClose } from "react-icons/gr";
import { MdFilterList } from "react-icons/md";
import Meeting from './reviewItem/meeting/Meeting';
import ReviewItem from './reviewItem/ReviewItem';
import ToggleButton from './ToggleButton/ToggleButton';
import { useAuth } from '../../../../Sign/authContext/AuthContext';

export default function Review(props) {
    const [review, setReview] = useState([]);
    const [filteredReviews, setFilteredReviews] = useState([]);
    const [filterCategory, setFilterCategory] = useState([]);
    const [filterDateReviews, setFilterDateReviews] = useState([]);
    const [selectedCategory, setSelectedCategory] = useState('');
    const [selectedMonth, setSelectedMonth] = useState('');
    const [selectedYear, setSelectedYear] = useState('');
    const [openPDF, setOpenPDF] = useState(false);
    const [openMeeting, setOpenMeeting] = useState(false);
    const [openCart, setOpenCart] = useState(false);
    const [openMeetingButton, setOpenMeetingButton] = useState(false);
    const [pdfData, setPDFData] = useState([]);
    const [openFormFilter, setOpenFormFilter] = useState(false);
    const [opentCartReview, setOpenCartReview] = useState(false);
    const [openReview, setOpenReview] = useState(true);
    const [toggleValue, setToggleValue] = useState(0);

    // Змінні та функції для роботи із затвердженням
    const [approv, setApprov] = useState([]);
    const [openFromDelete, setOpenFormDelete] = useState(false);
    const [openEditForm, setOpenEditForm] = useState(false);
    const [userId, setUserId] = useState();
    const { user } = useAuth();

    useEffect(() => {
        if (user) {
            setUserId(user.id) // Лише коли користувач доступний
        }
    }, [user]);

    const handleSubmitStateButton = useCallback(async (id) => {
        try {
            const maxRequests = 2;
            const perMilliseconds = 1000;

            const rateLimitedAxios = axiosRateLimit(axios.create(), {
                maxRequests: maxRequests,
                perMilliseconds: perMilliseconds,
            });

            const response = await rateLimitedAxios.post(`${NET.APP_URL}/review/status`, {
                id: id,
                togg: toggleValue,
                userId: userId
            });

            // console.log("id", response.data)
            setReview(response.data);
            setFilteredReviews(response.data);
            setFilterCategory(response.data);
            setFilterDateReviews(response.data);

            setSelectedCategory('Всі');
            setSelectedMonth('');
            setSelectedYear('');
            if (id === 1) {
                setOpenMeetingButton(true)
            } else {
                setOpenMeetingButton(false);
            }

            setOpenCart(true);
        } catch (error) {
            console.error(error);
        }
    }, [toggleValue, userId]);

    useEffect(() => {
        const loadStatuses = async () => {
            await axios.get(`${NET.APP_URL}/status`);
            
        };
        loadStatuses();
        handleSubmitStateButton(0);
    }, [handleSubmitStateButton]);

    const handleSelectCategory = (id) => {
        setSelectedCategory(id);

        let updatedReviews = [];

        if (id === 0) {
            updatedReviews = review;
        } else {
            updatedReviews = review.filter((item) => item.category_id === id);
        }

        setFilterCategory(updatedReviews);
        setFilterDateReviews(updatedReviews);
    };

    const handleSelectChange = (month, year) => {
        setSelectedMonth(month);
        setSelectedYear(year);
        filterReviews(month, year);
    };

    const handleMeeting = (data) => {
        setOpenMeeting(data);
        setOpenReview(!data);
    };

    const handleFilter = (data) => {
        setOpenFormFilter(data);
        setOpenReview(!data);
    };

    const filterReviews = (selectedMonth, selectedYear) => {
        const filteredReviews = filterCategory.filter((item) => {
            const dateParts = item.date.split('-');
            const month = dateParts[1];
            const year = dateParts[0];

            return (
                (selectedMonth === '' || month === selectedMonth) &&
                (selectedYear === '' || year === selectedYear)
            );
        });

        setFilterDateReviews(filteredReviews);
    };

    const handleOpenPDF = () => {
        setPDFData(filterDateReviews);
        setOpenPDF(true);
    };

    const handleClosePDF = () => {
        setOpenPDF(false);
    };

    const handleDeleteReview = (id) => {
        const updatedReviews = filterDateReviews && filterDateReviews.filter((item) => item.id !== id);
        setFilterDateReviews(updatedReviews);
    };

    const handleCloseFormFilter = () => {
        handleSelectCategory('Всі');
        setOpenFormFilter(false);
        setOpenReview(true);
    };

    const handleCloseMiiting = () => {
        setOpenReview(true);
        setOpenMeeting(false);
    };

    const handleDelete = () => {
        if (approv.length > 0) {
            axios
                .post(`${NET.APP_URL}/approveDelete`, {
                    id: approv[0].id
                })
                .then((response) => {
                    window.location.reload();
                })
                .catch((error) => {
                    console.error(error);
                });
        }

        setOpenFormDelete(false);
    };

    const handleFetchApprov = async (id) => {
        try {
            const response = await axios.post(`${NET.APP_URL}/approveReview`, { id });
            setApprov(response.data);
        } catch (error) {
            console.error(error);
        }
    };

    const handleToggleChange = (value) => {
        setToggleValue(value);
        handleSubmitStateButton(0);
    };

    return (
        <div>
            {!opentCartReview && (
                <div>
                    <div className='buttonsPDFandFILTER'>
                        <GrDocumentPdf className='buttonPDF' onClick={handleOpenPDF} />
                        <MdFilterList className='buttonFilter' onClick={() => handleFilter(true)} />
                        <ToggleButton onToggle={handleToggleChange} />
                    </div>
                    {openFormFilter && (
                        <div className='formFilterReview'>
                            <div className='mainReviewFilter'>
                                <div className='titleFilterForm'>Фільтрування даних за параметрами</div>
                                <div className='titleCategory'>Категорії</div>
                                <CategoryDialog
                                    categories={props.buttons}
                                    selectedCategory={selectedCategory}
                                    onSelectCategory={handleSelectCategory}
                                />
                                <div className='titleDate'>Дата подання</div>
                                <div className="filterDate">
                                    <MonthYearPicker
                                        reviews={filteredReviews}
                                        month={selectedMonth}
                                        year={selectedYear}
                                        onSelectChange={handleSelectChange}
                                    />
                                </div>
                                <div className='buttonFormFilterReview'>
                                    <div onClick={handleCloseFormFilter}>Відмінити</div>
                                    <div onClick={() => handleFilter(false)}>Застосувати</div>
                                </div>
                            </div>
                        </div>
                    )}
                    <div className="buttonStates">
                        <button className="button" onClick={() => handleSubmitStateButton(0)}>Всі</button>
                        <button className="button" onClick={() => handleSubmitStateButton(1)}>Подані</button>
                        <button className="button" onClick={() => handleSubmitStateButton(2)}>Затвердженням</button>
                        <button className="button" onClick={() => handleSubmitStateButton(3)}>Архівовані</button>
                        {/* {statuses.map((el) => (
                            <button key={el.id} onClick={() => handleSubmitStateButton(el.id)} className="button">
                                {el.title}
                            </button>
                        ))} */}
                    </div>
                    <main>
                        {openCart && (
                            <div className="mainReview">
                                <div className='mainHeadr'>
                                    {openMeetingButton && (
                                        <div onClick={() => handleMeeting(true)} className='meetingCommButton'>Засідання комісії</div>
                                    )}
                                </div>
                                {openPDF && (
                                    <div>
                                        <GrClose className='closePDF' onClick={handleClosePDF} />
                                        <PDFGenerator categories={props.buttons} data={pdfData} />
                                    </div>
                                )}
                                {openReview && (
                                    <div className="container">
                                        {filterDateReviews && filterDateReviews.map((el) => (
                                            <ReviewItems
                                                key={el.id}
                                                OpentReview={() => {
                                                    setOpenCartReview(true);
                                                    handleFetchApprov(el.id);
                                                }}
                                                categories={props.buttons}
                                                openCart={props.openCart}
                                                review={el}
                                                handleDeleteReview={handleDeleteReview}
                                                approv={approv}
                                                handleDelete={handleDelete}
                                                openFromDelete={openFromDelete}
                                                setOpenFormDelete={setOpenFormDelete}
                                                openEditForm={openEditForm}
                                                setOpenEditForm={setOpenEditForm}
                                            />
                                        ))}
                                    </div>
                                )}
                            </div>
                        )}
                    </main>
                </div>
            )}
            {openMeeting && (
                <Meeting
                    closeMeeting={handleCloseMiiting}
                    review={filteredReviews}
                    categories={props.buttons}
                    handleMeeting={handleMeeting}
                />
            )}
            {opentCartReview && (
                <ReviewItem
                    cart={props.cart}
                    categories={props.buttons}
                    OpentReview={() => setOpenCartReview(false)}
                    onDelete={props.onDelete}
                    approv={approv}
                    handleDelete={handleDelete}
                    openEditForm={openEditForm}
                    setOpenEditForm={setOpenEditForm}
                    openFromDelete={openFromDelete}
                    setOpenFormDelete={setOpenFormDelete}
                />
            )}
        </div>
    );
}