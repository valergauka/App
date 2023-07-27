import { Link } from 'react-router-dom';
import './FormDelete.css';

const FormDelete = ({ text, isOpen, onClose, onDelete, link}) => {
    if (!isOpen) {
        return null;
    }
    return (
        <div className='formDelete'>
            <form >
                <h2 className='titleFormDelete'>
                    Ви дійсно хочете видалити {text}?
                </h2>
                <div className="buttonsFormDelete">
                    <button className='buttonFormDeleteYes' onClick={onDelete}>
                        <Link to={link}>Так</Link>
                        </button>
                    <button className='buttonFormDeleteNo' onClick={onClose}>Ні</button>
                </div>
            </form>
        </div>
    );
}

export default FormDelete;