
import './Upload.css';

const Upload = (props) => {
    return (
        <form className="upload">
            <div className="uploadBody">
                <i className="riFileUploadLine">
                    <p>Drag file</p>
                    
                </i>
            </div>
            <footer className="uploadFooter">
                <label for='uploadInput' className="uploadButton">
                    <p>Orchoose file </p>
                    <input
                        type="file"
                        id="uploadInput"
                        name={props.nameInput}
                        onChange={(event) => props.handleFileChange(event, props.id, props.nameInput)} />
                </label>
            </footer>
        </form>
    );
}

export default Upload;