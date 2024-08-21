import React, { useEffect, useState } from "react";
import ReviewUserItems from "./ReviewUserItems";
import ReviewUserItem from "./ReviewUserItem";
import axios from "axios";
import NET from "../../../../network";
import './ReviewUser.css';
import Header from "../../../UIComponent/Header";
import { useAuth } from "../../../../Sign/authContext/AuthContext";
import { GrDocumentPdf, GrClose } from "react-icons/gr";
import PDFGenerator from "../../../UIComponent/PDFGenerator/PDFGenerator";

const ReviewUser = (props) => {
    const { user } = useAuth();
    const [statuses, setStatuses] = useState([]);
    const [currentUserId, setCurrentUserId] = useState(null);
    const [filteredReviews, setFilteredReviews] = useState([]);
    const [opentReview, setOpentReview] = useState(false);
    const [openPDF, setOpenPDF] = useState(false);
    const [pdfData, setPDFData] = useState([]);

    const handleOpenPDF = () => {
        const filterDateReviews = filteredReviews; // Update this as per your logic
        setPDFData(filterDateReviews);
        setOpenPDF(true);
    };

    const handleClosePDF = () => {
        setOpenPDF(false);
    };

    useEffect(() => {
        const loadStatuses = async () => {
            try {
                const response = await axios.get(`${NET.APP_URL}/status`);
                setStatuses(response.data);
            } catch (error) {
                console.error("Failed to load statuses", error);
            }
        };

        loadStatuses();
    }, []);

    useEffect(() => {
        if (user?.id) {
            setCurrentUserId(user.id);
        }
    }, [user]);

    const handleSubmitStateButton = async (id) => {
        try {
            const response = await axios.post(`${NET.APP_URL}/review/status`, { id });
            const allReviews = response.data;
            const userReviews = allReviews.filter(review => review.user_id === currentUserId);
            setFilteredReviews(userReviews);
        } catch (error) {
            console.error("Failed to fetch reviews", error);
        }
    };

    return (
        <div>
            {!opentReview && (
                <div>
                    <Header />
                    <div className="buttonStates">
                        <button className='button' onClick={() => handleSubmitStateButton(0)}>Всі</button>
                        {statuses.map(el => (
                            <button key={el.id} onClick={() => handleSubmitStateButton(el.id)} className='button'>
                                {el.title}
                            </button>
                        ))}
                    </div>
                    <main>
                        {!openPDF ? (
                            <GrDocumentPdf className='iconPDF' onClick={handleOpenPDF} />
                        ) : (
                            <div className='pdfModal'>
                                <div className='pdfContent'>
                                    <GrClose className='closePDF' onClick={handleClosePDF} />
                                    <PDFGenerator categories={props.buttons} data={pdfData} />
                                </div>
                            </div>
                        )}
                        <div className='container'>
                            {filteredReviews.map(el => (
                                <ReviewUserItems
                                    key={el.id}
                                    OpentReview={() => setOpentReview(!opentReview)}
                                    categories={props.buttons}
                                    openCart={props.openCart}
                                    review={el}
                                />
                            ))}
                        </div>
                    </main>
                </div>
            )}

            {opentReview && (
                <div>
                    <ReviewUserItem
                        categories={props.buttons}
                        categoriesPdf={props.categoriesPdf}
                        CloseCart={() => setOpentReview(!opentReview)}
                        cart={props.cart}
                    />
                </div>
            )}
        </div>
    );
};

export default ReviewUser;
