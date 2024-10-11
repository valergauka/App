import React, { useState, useEffect } from 'react';
import './MonthYearPicker.css';
const MonthYearPicker = ({ year, month, onSelectChange, reviews }) => {

    const [selectedMonth, setSelectedMonth] = useState(month || '');
    const [selectedYear, setSelectedYear] = useState(year || '');

    const [uniqueMonths, setUniqueMonths] = useState([]);
    const [uniqueYears, setUniqueYears] = useState([]);


    const handleMonthChange = (event) => {
        const selectedMonth = event.target.value;
        setSelectedMonth(selectedMonth);
        onSelectChange(selectedMonth, selectedYear);
    };

    const handleYearChange = (event) => {
        const selectedYear = event.target.value;
        setSelectedYear(selectedYear);
        onSelectChange(selectedMonth, selectedYear);
    };


    const getUniqueMonthsYears = () => {
        const months = reviews.map((review) => {
            console.log(review)
            if (review.date) {
                const dateParts = review.date.split('-');
                return dateParts[1];
            } else {
                return ''; 
            }
        });

        const years = reviews.map((review) => {
            if (review.date) {
                const dateParts = review.date.split('-');
                return dateParts[0];
            } else {
                return ''; // Або інше значення за замовчуванням
            }
        });

        const uniqueMonths = [...new Set(months)];
        const uniqueYears = [...new Set(years)];

        setUniqueMonths(uniqueMonths);
        setUniqueYears(uniqueYears);
    };

    useEffect(() => {
        getUniqueMonthsYears();
      }, [reviews]);

    return (
        <div className="month-year-input">
            <select
                className="month-select"
                value={selectedMonth}
                onChange={handleMonthChange}
            >
                <option value="">Оберіть місяць</option>
                {uniqueMonths.map((month) => (
                    <option key={month} value={month}>
                        {month}
                    </option>
                ))}
            </select>
            <select
                className="year-select"
                value={selectedYear}
                onChange={handleYearChange}
            >
                <option value="">Оберіть рік</option>
                {uniqueYears.map((year) => (
                    <option key={year} value={year}>
                        {year}
                    </option>
                ))}
            </select>
        </div>
    );
};

export default MonthYearPicker;
