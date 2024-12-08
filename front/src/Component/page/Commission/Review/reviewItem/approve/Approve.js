import './Approve.css';
import '../../../../User/Present/Form/Form.css';
import Button from '../../../../../UIComponent/Button';
import { useState } from 'react';
import NET from '../../../../../../network';
import axios from 'axios';

const Approve = (props) => {
  const [committeMNDate, setCommitteMNDate] = useState('');
  const [committeMNNumber, setCommitteMNNumber] = useState(0);
  const [committeSCDate, setCommitteSCDate] = useState('');
  const [committeSCNumber, setCommitteSCNumber] = useState(0);
  const [orderDate, setOrderDate] = useState('');
  const [orderNumber, setOrderNumber] = useState(0);
  const [resolution, setResolution] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();

    const formData = {
      committeMNDate: committeMNDate.trim() || '2000-01-01',
      committeMNNumber: committeMNNumber.toString().trim() || '0',
      committeSCDate: committeSCDate.trim() || '2000-01-01',
      committeSCNumber: committeSCNumber.toString().trim() || '0',
      orderDate: orderDate.trim() || '2000-01-01',
      orderNumber: orderNumber.toString().trim() || '0',
      resolution: resolution.trim() || ' ',
      review_id: props.cart.map(el => el.id), // Ensure this is an array
    };

    axios
      .post(`${NET.APP_URL}/createApprove`, formData)
      .then((response) => {
        window.location.href = '/review';
        console.log('Data submitted successfully:', response.data);
      })
      .catch((error) => {
        window.location.href = '/review';
        console.error('Error submitting data:', error.response ? error.response.data : error.message);
      });
  };

  return (
    <main className="mainForm">
      <h4 className="titleForm">{props.cart[0].category.title}</h4>
      <p>Освітня програма: {props.cart.map((el) => el.nameOp).join(', ')}</p>
      <form className="formAppApprove" onSubmit={handleSubmit}>
        <div className="cartNumApprove">
          <label className="labelApproveApprove">Протокол засідання Комісії</label>
          <div className="date-numApprove">
            <input
              type="date"
              lang="uk"
              name="committeMNDate"
              value={committeMNDate}
              onChange={(e) => setCommitteMNDate(e.target.value)}
            />
            <input
              type="number"
              min={1}
              lang="uk"
              placeholder="Номер"
              value={committeMNNumber}
              name="committeMNNumber"
              onChange={(e) => setCommitteMNNumber(e.target.value)}
            />
          </div>
        </div>
        <div className="cartNumApprove">
          <label className="labelApproveApprove">Протокол засідання Вченої ради</label>
          <div className="date-numApprove">
            <input
              type="date"
              lang="uk"
              value={committeSCDate}
              name="committeSCDate"
              onChange={(e) => setCommitteSCDate(e.target.value)}
            />
            <input
              type="number"
              min={1}
              lang="uk"
              placeholder="Номер"
              value={committeSCNumber}
              name="committeSCNumber"
              onChange={(e) => setCommitteSCNumber(e.target.value)}
            />
          </div>
        </div>
        <div className="cartNumApprove">
          <label className="labelApproveApprove">Наказ про утвердження</label>
          <div className="date-numApprove">
            <input
              type="date"
              lang="uk"
              value={orderDate}
              name="orderDate"
              onChange={(e) => setOrderDate(e.target.value)}
            />
            <input
              type="number"
              min={1}
              lang="uk"
              placeholder="Номер"
              value={orderNumber}
              name="orderNumber"
              onChange={(e) => setOrderNumber(e.target.value)}
            />
          </div>
        </div>
        <div>
          <label className="labelOn">Ухвала комісії</label>
          <textarea
            className="comentFormApprove"
            value={resolution}
            name="resolution"
            onChange={(e) => setResolution(e.target.value)}
          ></textarea>
        </div>
        <div className="buttonAppApprove"я>
          <Button title="Затвердити" />
        </div>
      </form>
    </main>
  );
};

export default Approve;
