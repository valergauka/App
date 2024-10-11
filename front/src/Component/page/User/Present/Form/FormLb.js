import React, { useEffect, useState } from 'react';
import { BsArrowLeftShort } from "react-icons/bs";
import Button from '../../../../UIComponent/Button';
import Header from '../../../../UIComponent/Header';
import NET from '../../../../../network';
import Input from './FormInput/Input';
import axios from 'axios';
import { useAuth } from '../../../../../Sign/authContext/AuthContext';
import './FormLb.css';
import './Form.css';

export default function FormLb(props) {
  const { user } = useAuth();
  const branchOut = [];
  const specialityOut = [];
  const specialisationOut = [];
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
  const currentDate = new Date();
  const year = currentDate.getFullYear();
  const month = String(currentDate.getMonth() + 1).padStart(2, '0');
  const day = String(currentDate.getDate()).padStart(2, '0');
  const formattedDate = `${year}-${month}-${day}`;

  const [educLevel, setEducLevel] = useState('');
  const [branch, setBranch] = useState('');
  const [speciality, setSpeciality] = useState('');
  const [specialisation, setSpecialisation] = useState('');
  const [nameOp, setNameOp] = useState('');
  const [guarantor, setGuarantor] = useState('');
  const [structural, setStructural] = useState('');
  const [faculty, setFaculty] = useState('');
  const category_id = props.orders.id;
  const status_id = 1;
  const user_id = user.id;

  const handleSubmit = async (event) => {
    event.preventDefault();
    const formData = {
      educLevel: educLevel,
      branch: branch,
      speciality: speciality,
      specialisation: specialisation || 'Немає спеціалізації',
      nameOp: nameOp,
      guarantor: guarantor,
      structural: structural,
      faculty: faculty,
      date: formattedDate,
      category_id: category_id,
      status_id: status_id,
      user_id: user_id
    };

    axios
      .post(`${NET.APP_URL}/reviewCreate`, formData)
      .then((response) => {
        props.reviewId(response.data);
        props.OpenFormPdf();
      })
      .catch((error) => {
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
  }, []);

  // Заповнення масивів для вибору спеціальності та інших полів
  op.map((el) => branchOut.push(el.branch));

  let f = 0;
  op.map(el => {
    if (branch === el.branch) {
      specialityOut.push(el.speciality);
      if (speciality === el.speciality) {
        specialisationOut.push(el.specialisation);
        if (specialisation === el.specialisation) {
          ops.push(el.op);
          f = 1;
        }
      }
    }
  });

  const CloseForm = () => {
    props.CloseForm();
  }

  return (
    <div>
      <Header />
      <main className='mainForm' >
        <div onClick={CloseForm} className='back'><BsArrowLeftShort /></div>
        <div className='titleForm'>
          <h3>{props.orders.title}</h3>
        </div>
        <form className='formLable'>
          <label className='labelForm'>Рівень освіти:</label>
          <Input nameInput='leveleducc' key='leveleducc'
            placeholderInput="Бакалавр/Магістр" arrayData={leveledUcc} value={educLevel} setValue={setEducLevel} />

          <label className='labelForm'>Галузь знань:</label>
          <Input nameInput='branch' key='branch' placeholderInput="Шифр та назва" arrayData={unique(branchOut)} value={branch} setValue={setBranch} />

          <label className='labelForm'>Спеціальність:</label>
          <Input nameInput='speciality' key='speciality' placeholderInput="Код та назва" arrayData={unique(specialityOut)} value={speciality} setValue={setSpeciality} />

          <div className={`spetializanion ${(speciality === '014 Середня освіта' ||
            speciality === '015 Професійна освіта' ||
            speciality === '035 Філологія' ||
            (speciality === '227' && educLevel === 'Магістр'))
            && 'active'}`}>
            <label className='labelForm'>Спеціалізація:</label>
            <Input nameInput='specialisation' key='specialisation' placeholderInput="Код та назва" arrayData={unique(specialisationOut)} value={specialisation} setValue={setSpecialisation} />
          </div>

          <label className='labelForm'>Освітня програма:</label>
          <Input nameInput='op' key='op' placeholderInput="Код та назва" arrayData={unique(ops)} value={nameOp} setValue={setNameOp} />

          <label className='labelForm'>Гарант програми:</label>
          <input
            className='inputText'
            type="text"
            name="guarantor"
            required placeholder="Прізвище ім`я по-батькові"
            value={guarantor} onChange={(e) => setGuarantor(e.target.value)} />

          <label className='labelForm'>Структурний підрозділ:</label>
          <input className='inputText' type="text" required placeholder="Кафедра, факультет/інститут..."
            value={structural} onChange={(e) => setStructural(e.target.value)} />

          <label className='labelForm'>Факультет/Інститут:</label>
          <Input nameInput='faculty' key='faculty' placeholderInput="Повна назва" arrayData={facultyName} value={faculty} setValue={setFaculty} />

          <div onClick={handleSubmit} className='formButton'>
            <Button title="Далі" />
          </div>
        </form>
      </main>
    </div>
  );
}
