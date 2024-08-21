import axios from 'axios';
import { useState, useEffect } from 'react';
import NET from './network';

const ReviewService = () => {
    const [reviews, setReviews] = useState([]);

    useEffect(() => {
        // Функція для завантаження всіх заявок з сервера
        const fetchReviews = async () => {
            try {
                const response = await axios.get(`${NET.APP_URL}/review`);
                setReviews(response.data);
            } catch (error) {
                console.error('Error fetching reviews:', error);
                // Обробка помилки (якщо потрібно)
            }
        };

        fetchReviews(); // Виклик функції при завантаженні компонента

    }, []); // Викликати тільки при монтажі компонента

    return reviews;
};

export default ReviewService;
