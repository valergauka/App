
import './FormPdf.css';
import Upload from './upload/Upload';

const CategoriesPdf = (props) => {
    
    return (
        <div className="categoriPDF">
            <label className='titleCategory'>{props.category.titule}</label>
            <Upload id={props.category.id} nameInput={props.category.titule} handleFileChange={props.handleFileChange}/>
            {/* <input type="file"accept="application/pdf" name={props.category.name} /> */}
        </div>
    );
};

export default CategoriesPdf;