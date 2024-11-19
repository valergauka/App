import React, { useState, useEffect, useCallback } from 'react';
import './MonthYearPicker.css';

const MonthYearPicker = ({ year, month, onSelectChange, reviews }) => {
    const [selectedMonth, setSelectedMonth] = useState(month || '');
    const [selectedYear, setSelectedYear] = useState(year || '');
    const [uniqueMonths, setUniqueMonths] = useState([]);
    const [uniqueYears, setUniqueYears] = useState([]);

    const handleMonthChange = (event) => {
        const monthValue = event.target.value;
        setSelectedMonth(monthValue);
        onSelectChange(monthValue, selectedYear);
    };

    const handleYearChange = (event) => {
        const yearValue = event.target.value;
        setSelectedYear(yearValue);
        onSelectChange(selectedMonth, yearValue);
    };

    const getUniqueMonthsYears = useCallback(() => {
        const months = reviews.map((review) => {
            if (review.date) {
                const dateParts = review.date.split('-');
                return dateParts[1];
            }
            return '';
        });

        const years = reviews.map((review) => {
            if (review.date) {
                const dateParts = review.date.split('-');
                return dateParts[0];
            }
            return '';
        });

        const uniqueMonths = [...new Set(months)];
        const uniqueYears = [...new Set(years)];

        setUniqueMonths(uniqueMonths);
        setUniqueYears(uniqueYears);
    }, [reviews]);

    useEffect(() => {
        getUniqueMonthsYears();
    }, [getUniqueMonthsYears]);

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
