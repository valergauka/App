import React, { useState} from 'react';
import { BsArrowLeftShort } from 'react-icons/bs';
import { Link } from 'react-router-dom';
import Button from '../../../../UIComponent/Button';
import Commentar from '../../../../UIComponent/comment/Commentar';
import './ReviewItem.css';
import ApproveOutput from '../../../../ApproveInput/ApproveOutput';
import NET from '../../../../../network';
import axios from 'axios';
import FormDelete from '../../../../UIComponent/formDelete/FormDelete';
import ApproveEdit from './approve/approveEdit/ApproveEdit';
import { useAuth } from '../../../../../Sign/authContext/AuthContext';
import FileList from '../../../../UIComponent/FileList/FileList';

const ReviewItem = (props) => {
    const approv = props.cart[0].approve;
    const [openFromDelete, setOpenFormDelete] = useState(false);
    const [openEditForm, setOpenEditForm] = useState(false);
    const [comment, setComment] = useState('');
    const { user } = useAuth();
    const reviewId = Number(props.cart.map(el => (el.id))) 
    
    console.log(props.cart)

    const handleDelete = () => {
        if (approv.length > 0) {
            axios
                .post(`${NET.APP_URL}/approveDelete`, { id: approv[0].id })
                .then((response) => {
                    window.location.reload();
                })
                .catch((error) => {
                    console.error(error);
                });
        }

        setOpenFormDelete(false);
    };

    const handleSubmit = () => {
        setOpenFormDelete(true);
    };

    const handleSubmitComment = () => {
        if (comment) {
            const commentData = {
                user_id: user.id, 
                review_id: reviewId,    
                comment: comment,
            };
            axios
                .post(`${NET.APP_URL}/createComment`, commentData)
                .then((response) => {
                    setComment('');
                })
                .catch((error) => {
                    console.error(error);
                });

        }
    };

    return (
        <div className="CartReview">
            <main className='mainCarts'>
                <div className='backCartReview' onClick={() => props.OpentReview()} ><BsArrowLeftShort /></div>
                <form className='cartForm '>
                    <h3 >{props.cart.map(el => el.category.title)}</h3>
                    <div>
                        <h5>Освітня програма:  {props.cart.map(el => (el.nameOp))}</h5>
                        <h5>Рівень:   {props.cart.map(el => (el.educLevel))}</h5>
                        <h5>Галузь знань:  {props.cart.map(el => (el.branch))}</h5>
                        <h5>Спеціальність:  {props.cart.map(el => (el.speciality))}</h5>
                        <h5>Спеціалізація:  {props.cart.map(el => (el.specialisation))}</h5>
                        <h5>Гарант програми:  {props.cart.map(el => (el.guarantor))}</h5>
                        <h5>Структурний підрозділ:  {props.cart.map(el => (el.structural))}</h5>
                        <h5>Факультет/Інститут:  {props.cart.map(el => (el.faculty))}</h5>
                        <h5>Дата подання:  {props.cart.map(el => (el.date))}</h5>
                        <h5>{props.cart.map(el => el.user ? el.user.name : '')}</h5>
                    </div>
                    <FileList reviewId={reviewId} files={props.cart[0].file}/>

                    {openEditForm ? (
                        <ApproveEdit categoryTitle={props.cart.map(el => el.category.title)} approve={approv} />
                    ) : (
                        <div>
                            {approv.length === 0 ? (
                                <Link className="buttonLink" to="/review/cart/approve">
                                    <Button title="Затвердити" />
                                </Link>
                            ) : (
                                <div>
                                    <h5 className="deliteApproveReview" onClick={() => handleSubmit()}>Видалити</h5>
                                            <ApproveOutput title={props.cart.map(el => el.category.title)} approve={approv} handleSubmit={handleSubmit} />
                                    <h5 onClick={() => setOpenEditForm(true)} className='buttonEdit'>Змінити</h5>
                                </div>
                            )}
                        </div>
                    )}

                    {openFromDelete && (
                        <FormDelete
                            link="/review"
                            text="затвердження"
                            isOpen={openFromDelete}
                            onClose={() => setOpenFormDelete(false)}
                            onDelete={handleDelete}
                        />
                    )}
                </form>
                <div className='comentForm'>
                    <textarea className='coment' placeholder='Залишіть свій коментар тут...' value={comment} onChange={(e) => setComment(e.target.value)}></textarea>
                    <button onClick={handleSubmitComment} className='buttonComentForm'>Надіслати</button>
                </div>
                <Commentar idReview={reviewId}  />
            </main>
        </div>

    );
}

export default ReviewItem;