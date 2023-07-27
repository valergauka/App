import React, { useState } from 'react';
import './CategoryDialog.css';

const CategoryDialog = (props) => {
  const [isOpen, setIsOpen] = useState(false);

  const handleToggleDropdown = () => {
    setIsOpen(!isOpen);
  };

  const handleSelectCategory = (category) => {
    props.onSelectCategory(category);
    setIsOpen(false);
  };

  return (
    <div className="category-dropdown">
      <button className="toggle-button" onClick={handleToggleDropdown}>
        {props.selectedCategory || 'Всі'}
      </button>
      {isOpen && (
        <ul className="category-list">
             <li
              className={`category-item ${
                props.selectedCategory === 'Всі' ? 'selected' : ''
              }`}
              onClick={() => handleSelectCategory('Всі')}
            >Всі</li>
          {props.categories.map((category) => (
            <li
              key={category.id} // Використовуємо поле id як ключ
              className={`category-item ${
                props.selectedCategory === category.title ? 'selected' : ''
              }`}
              onClick={() => handleSelectCategory(category.title)}
            >
              {category.title}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default CategoryDialog;
