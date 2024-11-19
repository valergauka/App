import { useState } from 'react';
import './Upload.css';

const Upload = (props) => {
    const [drag, setDrag] = useState(false);
    const [filesList, setFilesList] = useState([]);

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
        let files = [...e.dataTransfer.files];

        // Перевіряємо, чи всі файли є PDF
        if (files.every(file => file.type === 'application/pdf' || file.name.endsWith('.pdf'))) {
            setFilesList(files); // Додаємо файли до стану
            props.handleFileChange(files);
        } else {
            alert('Будь ласка, перетягніть лише файли PDF.');
        }
    };

    const handlerInputFile = (e) => {
        e.preventDefault();
        const files = Array.from(e.target.files);

        // Перевіряємо, чи всі файли є PDF
        if (files.every(file => file.type === 'application/pdf' || file.name.endsWith('.pdf'))) {
            setFilesList(files); // Додаємо файли до стану
            props.handleFileChange(files);
        } else {
            alert('Будь ласка, виберіть лише файли PDF.');
        }
    };

    return (
        <form className={'upload'} action="/upload-files" method="post" encType="multipart/form-data">
            <div
                className={`uploadBody ${drag ? 'dragging' : ''}`}
                onDragOver={dragStartHandler}
                onDragLeave={dragLeaveHandler}
                onDrop={onDropHandler}
            >
                <i className="riFileUploadLine"></i>
                {drag ? <p>Відпустіть файли</p> : <p>Перетягніть файли</p>}
                <div className="fileList">
                    {filesList.length > 0 && (
                        <ul>
                            {filesList.map((file, index) => (
                                <li key={index}>{file.name}</li>
                            ))}
                        </ul>
                    )}
                </div>
            </div>
            <footer className="uploadFooter">
                <label htmlFor="uploadInput" className="uploadButton">
                    <p>Виберіть файли:</p>
                    <input
                        type="file"
                        id="uploadInput"
                        name='files'
                        accept=".pdf"
                        multiple
                        onChange={handlerInputFile}
                    />
                </label>
            </footer>
        </form>
    );
};

export default Upload;
