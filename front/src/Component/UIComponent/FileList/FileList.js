import React, { useState, useEffect } from 'react';
import axios from 'axios';
import NET from '../../../network';
import './FileList.css';

export default function FileList(props) {
    const [files, setFiles] = useState([]);
    const reviewId = props.reviewId;

    useEffect(() => {
        // Make an API request to fetch files by reviewId
        axios.get(`${NET.APP_URL}/files/${reviewId}`)
            .then(response => {
                setFiles(response.data);
            })
            .catch(error => {
                console.error('Error fetching files:', error);
            });
    }, [reviewId]);

    return (
        <div>
            {files.length === 0 ? (
                <h4>Немає завантажених файлів</h4>
            ) : (
                <div>
                    <h4>Завантажені документи:</h4>
                    <ul>
                        {files.map((file, index) => (
                            <li key={index}>
                                <a className='nameFile'
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
