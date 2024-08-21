import React, { useState } from 'react';

function ForgotPassword() {
    const [email, setEmail] = useState('');
    const [message, setMessage] = useState('');

    const handleEmailChange = (e) => {
        setEmail(e.target.value);
    };

    const handleForgotPassword = async () => {
        try {
            const response = await fetch(`${NET.APP_URL}forgot-password`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ email }),
            });

            if (response.status === 200) {
                setMessage('Лист із інструкціями для скидання пароля відправлено на вашу пошту.');
            } else {
                setMessage('Помилка. Перевірте правильність введеної адреси електронної пошти.');
            }
        } catch (error) {
            setMessage('Помилка сервера.');
        }
    };

    return (
        <div>
            <h2>Забули пароль</h2>
            <div>
                <input type="email" placeholder="Ваша пошта" value={email} onChange={handleEmailChange} />
                <button onClick={handleForgotPassword}>Скинути пароль</button>
            </div>
            <p>{message}</p>
        </div>
    );
}

export default ForgotPassword;
