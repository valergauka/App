import React, {useState, useEffect} from "react";

import NET from '../../../network';
import axios from 'axios';

import { GoChevronDown } from "react-icons/go";

import './Commentar.css';

const Commentar = (props) => {
    const [comment, setComment] = useState([]);
    const [user, setUser] = useState([]);
    let [commentOpen, setCommentOpen] = useState(false);


    useEffect(() => {
        const loadComment = async () => {
            const response = await axios.get(`${NET.APP_URL}/comment`);
            setComment(response.data)
        }
        loadComment();
    }, [])


    useEffect(() => {
        const loadUsers = async () => {
            const response = await axios.get(`${NET.APP_URL}/user`);
            setUser(response.data)
        }
        loadUsers();
    }, [])



    const comentari = [];
    comment.map(el => {
        if (Number(el.idReview) === Number(props.cart.map(el => (el.id)))) {
            comentari.push(el)

        }
    })
    const userse = [];
    user.map(el => {
        userse.push(el.name)
    })

    return (
        <div className="comments">
            <div className={`comentarName ${commentOpen && 'active'}`} onClick={() => setCommentOpen(commentOpen = !commentOpen)}>
                <h3>Коментарі <GoChevronDown className='iconComment' /></h3>
            </div>
            {commentOpen && (
                comentari.map(el =>
                (
                    <div>
                        <b className="userComment">{userse[el.idUser]}</b>
                        <div className="comentar ">
                            <p>{el.comment}</p>
                            <div className="commentDate">
                                <b>{el.date}</b>
                            </div>
                        </div>
                    </div>))

            )}

        </div>
    );
}

export default Commentar;