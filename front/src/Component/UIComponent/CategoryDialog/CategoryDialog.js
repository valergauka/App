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

  const selectedCategory = props.categories.find(category => category.id === props.selectedCategory);

  return (
    <div className="category-dropdown">
      <button className="togle-button" onClick={handleToggleDropdown}>
        {selectedCategory ? selectedCategory.title : 'Всі'}
      </button>
      {isOpen && (
        <ul className="category-list">
          <li
            className={`category-item ${props.selectedCategory === 0 ? 'selected' : ''}`}
            onClick={() => handleSelectCategory(0)}
          >
            Всі
          </li>
          {props.categories.map(category => (
            <li
              key={category.id}
              className={`category-item ${props.selectedCategory === category.id ? 'selected' : ''}`}
              onClick={() => handleSelectCategory(category.id)}
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
