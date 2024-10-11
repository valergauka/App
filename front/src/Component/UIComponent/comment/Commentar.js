import React, { useState, useEffect } from "react";
import NET from '../../../network';
import axios from 'axios';
import { GoChevronDown } from "react-icons/go";
import { useAuth } from "../../../Sign/authContext/AuthContext";
import './Commentar.css';

const Commentar = (props) => {
    const [comment, setComment] = useState([]);
    let [commentOpen, setCommentOpen] = useState(false);
    const { user } = useAuth();


    const handleComment = () => {
        setCommentOpen(!commentOpen);
        // Send a POST request to fetch comments
        axios.post(`${NET.APP_URL}/reviews/comments`, { reviewId: props.idReview })
            .then((response) => {
                setComment(response.data);
            })
            .catch((error) => {
                // Handle errors, e.g., display an error message
                console.error(error);
            });
    };

    function formatDate(dateString) {
        const options = { year: 'numeric', month: 'long', day: 'numeric' };
        const date = new Date(dateString);
        return date.toLocaleDateString('uk-UA', options);
    }


    const handleDeleteComment = (id) => {
        
        axios.delete(`${NET.APP_URL}/comment/${id}`)
            .then(response => {
                handleComment();
                // Тут ви можете виконати додаткові дії після видалення
            })
            .catch(error => {
                console.error('Помилка видалення користувача', error);
            });

    };


    return (
        <div className="comments">
            <div className={`comentarName ${commentOpen && 'active'}`} onClick={handleComment}>
                <h3>Коментарі <GoChevronDown className='iconComment' /></h3>
            </div>
            {commentOpen && (
                comment
                    .slice() // Create a shallow copy of the comment array to avoid mutating the original array
                    .sort((a, b) => new Date(b.created_at) - new Date(a.created_at))
                    .map((comment) => (
                        <div key={comment.id}>
                            <b className="userComment">{comment.user.name}</b>
                            <div className="comment">
                                <p className="commentText">{comment.comment}</p>
                                <div className="commentDate">
                                    <b className="dataComent">{formatDate(comment.created_at)}</b>
                                    {comment.user.id === user.id && (
                                        <button className="deliteComment" onClick={() => handleDeleteComment(comment.id)}>Видалити</button>
                                    )}
                                </div>
                            </div>

                        </div>
                    ))
            )}
        </div>
    );
}

export default Commentar;
