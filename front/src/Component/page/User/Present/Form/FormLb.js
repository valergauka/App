import React, { useEffect, useState } from 'react';
import { BsArrowLeftShort } from "react-icons/bs";
import { Link } from 'react-router-dom';
import Button from '../../../../UIComponent/Button';
import Header from '../../../../UIComponent/Header';
import NET from '../../../../../network';
import Input from './FormInput/Input';
import axios from 'axios';

import './FormLb.css';
import './Form.css';



export default function FormLb(props) {
  const branch = [];
  const speciality = [];
  const specialisation = [];
  const ops = [];
  const facultyName = [
    'Навчально-науковий інститут біології, хімії та біоресурсів',
    'Навчально-науковий інститут фізико-технічних та комп`ютерних наук',
    'Факультет архітектури, будівництва та декорптивно-прикладного мистецтва',
    'Географічний факультет',
    'Економічний факультет',
    'Факультет іноземних мов',
    'Факультет історії, політології та міжнародних відносин',
    'Факультет математики та інформатики',
    'Факультет педагогіки, психології та соціальної роботи',
    'Факультет фізичної культури та здоров`я людини',
    'Філологічний факультет',
    'Юридичний факультет'
  ];
  const leveledUcc = [
    'Бакалавр',
    'Магістр',
    'Освітньо-науковий'
  ];
  const [op, setOp] = useState([]);
  const category = props.orders[1].title;
  let date = new Date()

  const [educLevel, setEducLevel] = useState('');
  const [branchInput, setBranchInput] = useState('');
  const [specialityInput, setSpecialityInput] = useState('');
  const [specialisationInput, setSpecialisationInput] = useState('');
  const [opInput, setOpInput] = useState('');
  const [guaranty, setGuaranty] = useState('');
  const [structural, setStructural] = useState('');
  const [faculty, setFaculty] = useState('');


  const handleSubmit = (event) => {
    event.preventDefault();
      const formData = {
          educLevel: educLevel,
          branch: branchInput,
          speciality: specialityInput,
          specialisation: specialisationInput,
          nameOp: opInput,
          guaranty: guaranty,
          structural: structural,
          faculty: faculty,
          category:category,
          date: date
      };
      console.log(formData);

      fetch(`${NET.APP_URL}/review`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
      })
      .then(response => {
        console.log(response.data);
       // window.location.reload();
      })
      .catch(error => {
        console.error(error);
      });
     }


  function unique(arr) {
    let result = [];
    for (let str of arr) {
      if (!result.includes(str)) {
        result.push(str);
      }
    }
    return result;
  }

  useEffect(() => {
    const loadOp = async () => {
      const response = await axios.get(`${NET.APP_URL}/op`);
      setOp(response.data)
    }
    loadOp();
  }, [])

  op.map(el => (
    branch.push(el.branch)
    // speciality.push(el.speciality),
    // specialisation.push(el.specialisation),
    // ops.push(el.op)
  ));

  op.map(el => {
    if (branchInput === el.branch) {
      speciality.push(el.speciality)
    }
    if (specialityInput === el.speciality) {
      specialisation.push(el.specialisation)
    }
    if (specialisationInput === el.specialisation) {
      ops.push(el.op)
    }
  })

  console.log(branchInput);
  return (
    <div>
      <Header />
      <main className='mainForm' >
        <Link to='/present' className='back' ><BsArrowLeftShort /></Link>
        <div className='titleForm'>
          <h3>{category}</h3>
        </div>
        <form className='formLable'>
          <label for="">Рівень осівіти:</label>
          <Input nameInput='leveleducc' key='0'
            placeholderInput="Бакалавр/Магістр" arrayData={leveledUcc} value={educLevel} setValue={setEducLevel} />

          <label for="">Галузь знань:</label>
          <Input nameInput='branch' key='1' placeholderInput="Шифр та назва" arrayData={unique(branch)} value={branchInput} setValue={setBranchInput}  />

          <label for="">Спеціальність:</label>
          <Input key='2' nameInput='speciality' placeholderInput="Код та назва" arrayData={unique(speciality)} value={specialityInput} setValue={setSpecialityInput} />

          <div className={`spetializanion ${(specialityInput === '014 Середня освіта' ||
            specialityInput === '015 Професійна освіта' ||
            specialityInput=== '035 Філологія' ||
            (specialityInput === '227' && educLevel === 'Магістр'))
            && 'active'}`}>
            <label for="">Спеціалізація:</label>
            <Input key='3' nameInput='specialisation' placeholderInput="Код та назва" arrayData={unique(specialisation)} value={specialisationInput} setValue={setSpecialisationInput}/>
          </div>
          <label for='' >Освітня програма:</label>
          <Input key='5' nameInput='op' placeholderInput="Код та назва" arrayData={unique(ops)} value={opInput} setValue={setOpInput} />

          <label for="">Гарант програми:</label>
          <input
            className='inputText'
            type="text"
            name="guaranty"
            required placeholder="Прізвище ім`я по-батькові"
            value={guaranty} onChange={(e) => setGuaranty(e.target.value)}/>

          <label for="">Структурний підрозділ:</label>
          <input
            className='inputText'
            type="text"
            name="structural"
            required placeholder="Кафедра, факултет/інститут..."
            value={structural} onChange={(e) => setStructural(e.target.value)}/>

          <label for="">Факультет/Інститут:</label>
          <Input key='6' nameInput='faculty' placeholderInput="Повна назва" arrayData={facultyName} value={faculty} setValue={setFaculty}  />
          
          
          <Link  to='/present/form/form' className='formButton' onClick={handleSubmit}>
            <Button title="Далі" />
          </Link>
        </form>
      </main>
    </div>

  )
}
