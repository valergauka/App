import React, { useState } from 'react';
import Button from '..//Button';
import './FileList.css';
import NET from '../../../network';
import axios from 'axios';

export default function FileList(props) {
    const idStatus = props.status;
    const [deletingFileId, setDeletingFileId] = useState(null); // Track which file is being deleted

    const handleDeleteFile = async (fileId) => {
        setDeletingFileId(fileId); // Mark file as being deleted
        try {
            const response = await axios.delete(`${NET.APP_URL}/files/${fileId}`);
            if (response.status === 200) {
                props.onFileDeleted(fileId); // Notify parent to update file list
            } else {
                console.error('Failed to delete file:', response.statusText);
            }
        } catch (error) {
            console.error('Error deleting file:', error);
        } finally {
            setDeletingFileId(null); // Reset deleting state
        }
    };

    return (
        <div>
            {idStatus === 4 && (
                <div onClick={props.handleAddFilesClick}>
                    <Button title="Додати файли" />
                </div>
            )}
            {props.files.length === 0 ? (
                <div>
                    <h4>Немає завантажених файлів</h4>
                </div>
            ) : (
                <div>
                    <h4>Завантажені документи:</h4>
                    <ul>
                        {props.files.map((file) => (
                            <li key={file.id}>
                                {idStatus === 4 && (
                                    <button
                                        onClick={() => handleDeleteFile(file.id)}
                                        disabled={deletingFileId === file.id} // Disable button if file is being deleted
                                    >
                                        {deletingFileId === file.id ? 'Видаляється...' : '❌'}
                                    </button>
                                )}
                                <a
                                    className="nameFile"
                                    href={`${NET.REACT_APP_SERVER_URL}${file.file_path}`}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                >
                                    {file.file_name}
                                </a>
                            </li>
                        ))}
                    </ul>
                </div>
            )}
        </div>
    );
}
