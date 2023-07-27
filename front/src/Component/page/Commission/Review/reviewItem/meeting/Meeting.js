import React, { useState } from 'react';
import './Meeting.css';
import MeetingReview from './MeetingReview';
import { FcCheckmark } from "react-icons/fc";
import { IoMdCloseCircleOutline } from "react-icons/io";

const Meeting = (props) => {
    const [committeeMNDate, setCommitteeMNDate] = useState('');
    const [committeeMNNumber, setCommitteeMNNumber] = useState('');
    const [committeeSCDate, setCommitteeSCDate] = useState('');
    const [committeeSCNumber, setCommitteeSCNumber] = useState('');
    const [orderDate, setOrderDate] = useState('');
    const [orderNumber, setOrderNumber] = useState('');
    const [openReview, setOpenReview] = useState(true);
    const [selectedReviews, setSelectedReviews] = useState(props.review);

    if (selectedReviews.length === 0) {
        props.handleMeeting(false)
    }


    const handleSelectReview = (id) => {
        setSelectedReviews(selectedReviews.filter((review) => review.id !== id));
    };


    const handleAddApprove = () => {
        //додати відправку данних на серве

        props.handleMeeting(false)
    }

    return (
        <div className="meetingCart">
            <form >
                {
                    openReview &&
                    <div>
                        <FcCheckmark onClick={() => setOpenReview(false)} className='checkMark' />
                        <div className="formMeetingCart">
                            {selectedReviews.map((el) => (
                                <MeetingReview
                                    key={el.id}
                                    review={el}
                                    handleSelectReview={handleSelectReview}
                                />
                            ))}
                        </div>

                    </div>
                }
                {
                    !openReview &&

                    <div>
                        <IoMdCloseCircleOutline className='closeForm' onClick={() => props.handleMeeting(false)}/>
                        <form className='formApp'>
                            <div className='cartNum'>
                                <label className='labelApprove'>Протокол засідання Комісії</label>
                                <div className='date-num'>
                                    <input
                                        type='date'
                                        value={committeeMNDate}
                                        onChange={e => setCommitteeMNDate(e.target.value)}
                                    />
                                    <input
                                        type='number'
                                        min={1}
                                        placeholder='Номер'
                                        value={committeeMNNumber}
                                        onChange={e => setCommitteeMNNumber(e.target.value)}
                                    />
                                </div>
                            </div>
                            <div className='cartNum'>
                                <label className='labelApprove'>Протокол засідання Вченої ради</label>
                                <div className='date-num'>
                                    <input
                                        type='date'
                                        value={committeeSCDate}
                                        onChange={e => setCommitteeSCDate(e.target.value)}
                                    />
                                    <input
                                        type='number'
                                        min={1}
                                        placeholder='Номер'
                                        value={committeeSCNumber}
                                        onChange={e => setCommitteeSCNumber(e.target.value)}
                                    />
                                </div>
                            </div>
                            <div className='cartNum'>
                                <label className='labelApprove'>Наказ про утвердження</label>
                                <div className='date-num'>
                                    <input
                                        type='date'
                                        value={orderDate}
                                        onChange={e => setOrderDate(e.target.value)}
                                    />
                                    <input
                                        type='number'
                                        min={1}
                                        placeholder='Номер'
                                        value={orderNumber}
                                        onChange={e => setOrderNumber(e.target.value)}
                                    />
                                </div>
                            </div>
                        </form>
                        <FcCheckmark onClick={handleAddApprove} className='checkMarkAddApprove' />
                    </div>
                }

            </form>
        </div>
    );
};

export default Meeting;
