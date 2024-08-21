import React, { useState } from 'react';
import './Meeting.css';
import MeetingReview from './MeetingReview';
import { FcCheckmark } from "react-icons/fc";
import { IoMdCloseCircleOutline } from "react-icons/io";
import axios from 'axios';
import NET from '../../../../../../network';
import { GrClose } from 'react-icons/gr';

const Meeting = (props) => {
    const [committeMNDate, setCommitteMNDate] = useState('');
    const [committeMNNumber, setCommitteMNNumber] = useState(0);
    const [committeSCDate, setCommitteSCDate] = useState('');
    const [committeSCNumber, setCommitteSCNumber] = useState(0);
    const [orderDate, setOrderDate] = useState('');
    const [orderNumber, setOrderNumber] = useState(0);
    const resolution = 'Не має ухвали';
    const [openReview, setOpenReview] = useState(true);
    const [selectedReviews, setSelectedReviews] = useState(props.review);

    if (selectedReviews.length === 0) {
        props.handleMeeting(false)
    }


    const handleSelectReview = (id) => {
        setSelectedReviews(selectedReviews.filter((review) => review.id !== id));
    };



    const handleAddApprove = (event) => {
        event.preventDefault();

        // Assuming selectedReviews is an array of review objects
        const reviewIds = selectedReviews.map((review) => review.id);

        const formData = {
            committeMNDate: committeMNDate.trim() || '2000-01-01',
            committeMNNumber: committeMNNumber.toString().trim() || '0',
            committeSCDate: committeSCDate.trim() || '2000-01-01',
            committeSCNumber: committeSCNumber.toString().trim() || '0',
            orderDate: orderDate.trim() || '2000-01-01',
            orderNumber: orderNumber.toString().trim() || '0',
            resolution: resolution.trim() || ' ',
            review_id: reviewIds // Ensure this is an array
        };

        console.log('Form Data:', formData); // Log formData to verify

        axios
            .post(`${NET.APP_URL}/createApprove`, formData)
            .then((response) => {
                console.log('Success:', response.data);
            })
            .catch((error) => {
                if (error.response) {
                    console.error('Server Error:', error.response.data);
                    console.error('Status:', error.response.status);
                    console.error('Headers:', error.response.headers);
                } else if (error.request) {
                    console.error('Network Error:', error.request);
                } else {
                    console.error('Error:', error.message);
                }
            });

        props.handleMeeting(false);
    };




    return (
        <div className="meetingCart">
            <form >
                {
                    openReview &&
                    <div>
                        <div>
                            <div onClick={() => setOpenReview(false)} className='checkMark' >Далі</div>
                            <GrClose className='checkClose' onClick={props.closeMeeting} />
                        </div>
                        <div className="formMeetingCart">
                            {selectedReviews.map((el) => (
                                <MeetingReview
                                    key={el.id}
                                    review={el}
                                    categories={props.categories}
                                    handleSelectReview={handleSelectReview}
                                />
                            ))}
                        </div>
                    </div>
                }
                {
                    !openReview &&

                    <div>
                        <IoMdCloseCircleOutline className='closeForm' onClick={() => props.handleMeeting(false)} />
                        <form className='formApp'>
                            <div className='cartNum'>
                                <label className='labelApprove'>Протокол засідання Комісії</label>
                                <div className='date-num'>
                                    <input
                                        type='date'
                                        name='committeMNDate'
                                        value={committeMNDate}
                                        onChange={e => setCommitteMNDate(e.target.value)}
                                    />
                                    <input
                                        type='number'
                                        placeholder='Номер'
                                        value={committeMNNumber}
                                        name='committeMNNumber'
                                        onChange={e => setCommitteMNNumber(e.target.value)}
                                    />
                                </div>
                            </div>
                            <div className='cartNum'>
                                <label className='labelApprove'>Протокол засідання Вченої ради</label>
                                <div className='date-num'>
                                    <input
                                        type='date'
                                        value={committeSCDate}
                                        name='committeSCDate'
                                        onChange={e => setCommitteSCDate(e.target.value)}
                                    />
                                    <input
                                        type='number'
                                        placeholder='Номер'
                                        value={committeSCNumber}
                                        name='committeSCNumber'
                                        onChange={e => setCommitteSCNumber(e.target.value)}
                                    />
                                </div>
                            </div>
                            <div className='cartNum'>
                                <label className='labelApprove'>Наказ про утвердження</label>
                                <div className='date-num'>
                                    <input
                                        type='date'
                                        value={orderDate}
                                        name='orderDate'
                                        onChange={e => setOrderDate(e.target.value)}
                                    />
                                    <input
                                        type='number'
                                        placeholder='Номер'
                                        value={orderNumber}
                                        name='orderNumber'
                                        onChange={e => setOrderNumber(e.target.value)}
                                    />
                                </div>
                            </div>
                        </form>
                        <GrClose className='checkCloseFormNum' onClick={props.closeMeeting} />
                        <FcCheckmark onClick={handleAddApprove} className='checkMarkAddApprove' />
                    </div>
                }
            </form>
        </div>
    );
};

export default Meeting;
