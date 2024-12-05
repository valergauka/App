import { useState } from 'react';
import './Upload.css';

const Upload = (props) => {
    const [drag, setDrag] = useState(false);

    const dragStartHandler = (e) => {
        e.preventDefault();
        setDrag(true);
    };

    const dragLeaveHandler = (e) => {
        e.preventDefault();
        setDrag(false);
    };

    const onDropHandler = (e) => {
        e.preventDefault();
        setDrag(false);
        const files = Array.from(e.dataTransfer.files);

        if (files.every(file => file.type === 'application/pdf' || file.name.endsWith('.pdf'))) {
            props.handleFileChange(files);
        } else {
            alert('Будь ласка, перетягніть лише файли PDF.');
        }
    };

    const handlerInputFile = (e) => {
        const files = Array.from(e.target.files);

        if (files.every(file => file.type === 'application/pdf' || file.name.endsWith('.pdf'))) {
            props.handleFileChange(files);
        } else {
            alert('Будь ласка, виберіть лише файли PDF.');
        }
    };

    return (
        <form className="upload" action="/upload-files" method="post" encType="multipart/form-data">
            <div
                className={`uploadBody ${drag ? 'dragging' : ''}`}
                onDragOver={dragStartHandler}
                onDragLeave={dragLeaveHandler}
                onDrop={onDropHandler}
            >
                <i className="riFileUploadLine"></i>
                {drag ? <p>Відпустіть файли</p> : <p>Перетягніть файли</p>}
            </div>
            <footer className="uploadFooter">
                <label htmlFor="uploadInput" className="uploadButton">
                    Виберіть файли
                    <input
                        type="file"
                        id="uploadInput"
                        accept=".pdf"
                        multiple
                        onChange={handlerInputFile}
                        style={{ display: 'none' }}
                    />
                </label>
            </footer>
        </form>
    );
};

export default Upload;
