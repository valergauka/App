import React, { useState, useEffect } from 'react';
import axios from 'axios';
import NET from '../../../network';
import './FileList.css';

export default function FileList(props) {

    return (
        <div>
            {props.files.length === 0 ? (
                <h4>Немає завантажених файлів</h4>
            ) : (
                <div>
                    <h4>Завантажені документи:</h4>
                    <ul>
                        {props.files.map((file, index) => (
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
