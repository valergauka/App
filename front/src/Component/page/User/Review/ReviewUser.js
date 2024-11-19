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
    const [idStatuses, setIdStatuses] = useState(0);
    const [error, setError] = useState('');
    const [isLoadingPDF, setIsLoadingPDF] = useState(false);

    const handleOpenPDF = () => {
        setIsLoadingPDF(true);
        setPDFData(filteredReviews);
        setOpenPDF(true);
        setIsLoadingPDF(false);
    };

    const handleClosePDF = () => {
        setOpenPDF(false);
    };

    const handleDeleteReview = async (id) => {
        try {
            await axios.post(`${NET.APP_URL}/reviewDelete`, { id });
            setFilteredReviews(filteredReviews.filter(review => review.id !== id));
        } catch (error) {
            console.error("Failed to delete review", error);
        }
    };

    useEffect(() => {
        const loadStatuses = async () => {
            try {
                const response = await axios.get(`${NET.APP_URL}/status`);
                setStatuses(response.data);
            } catch (error) {
                setError("Failed to load statuses");
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
        setIdStatuses(id);
        try {
            const response = await axios.post(`${NET.APP_URL}/review/status`, { id });
            const allReviews = response.data;
            const userReviews = allReviews.filter((review) => review.user_id === currentUserId);
            setFilteredReviews(userReviews);
        } catch (error) {
            console.error("Error submitting review:", error.response || error.message);
            setError("Failed to fetch reviews");
        }
    };

    return (
        <div>
            {error && <div className="error-message">{error}</div>}
            {!opentReview && (
                <div>
                    <Header />
                    <div className="buttonStates">
                        <button className={`buttonUser ${idStatuses === 0 ? 'active' : ''}`} onClick={() => handleSubmitStateButton(0)}>Всі</button>
                        {statuses.map(el => (
                            <button key={el.id} onClick={() => handleSubmitStateButton(el.id)} className={`buttonUser ${idStatuses === el.id ? 'active' : ''}`}>
                                {el.title}
                            </button>
                        ))}
                    </div>
                    <main>
                        {!openPDF ? (
                            isLoadingPDF ? (
                                <div>Loading PDF...</div>
                            ) : (
                                <GrDocumentPdf className='iconPDFUser' onClick={handleOpenPDF} />
                            )
                        ) : (
                            <div className='pdfModal'>
                                <div className='pdfContentUser'>
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
                                    status={idStatuses}
                                    onDelete={handleDeleteReview}
                                />
                            ))}
                        </div>
                    </main>
                </div>
            )}

            {opentReview && (
                <div>
                    <ReviewUserItem
                        status={idStatuses}
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
