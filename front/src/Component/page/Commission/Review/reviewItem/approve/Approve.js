
import './Approve.css';
import '../../../../User/Present/Form/Form.css';
import Button from '../../../../../UIComponent/Button';
import { useState } from 'react';

const Approve = (props) => {
    const [value, setValue] = useState({});

    console.log(value)
    return (
        <main className='mainForm'>
            <h4 className='titleForm'>{props.cart.map(el => (el.category))}</h4>
            <form className='formApp'>
                <div className='cartNum'>
                    <label className='labelApprove'>Протокол засідання Комісії</label>
                    <div className='date-num'>
                        <input type="date"
                            value={value['committeeMNDate']}
                            onChange={(e) => setValue({
                                ...value,
                                ['committeeMNDate']: e.target.value
                            })} />
                        <input type="number"
                            value={value['committeeMNNumber']}
                            onChange={(e) => setValue({
                                ...value,
                                ['committeeMNNumber']: e.target.value
                            })} min={1}
                            placeholder="Номер" />
                    </div>
                </div>
                <div className='cartNum'>
                    <label className='labelApprove'>Протокол засідання Вченої ради</label>
                    <div className='date-num'>
                        <input type="date"
                            value={value['committeeSCDate']}
                            onChange={(e) => setValue({
                                ...value,
                                ['committeeSCDate']: e.target.value
                            })} />
                        <input type="number"
                            value={value['committeeSCNumber']}
                            onChange={(e) => setValue({
                                ...value,
                                ['committeeSCNumber']: e.target.value
                            })}
                            min={1} placeholder="Номер" />
                    </div>
                </div>
                <div className='cartNum'>
                    <label className='labelApprove'>Наказ про утвердження</label>
                    <div className='date-num'>
                        <input type="date"
                            value={value['orderDate']}
                            onChange={(e) => setValue({
                                ...value,
                                ['orderDate']: e.target.value
                            })} />
                        <input type="number"
                            value={value['orderNumber']}
                            onChange={(e) => setValue({
                                ...value,
                                ['orderNumber']: e.target.value
                            })}
                            min={1}
                            placeholder="Номер" />
                    </div>
                </div>
            </form>
            <label className='labelOn'>Ухвала комісії </label>
            <div >
                <textarea
                    className='comentFormApprove'
                    value={value['resolution']}
                    onChange={(e) => setValue({
                        ...value,
                        ['resolution']: e.target.value
                    })}></textarea>
            </div>
            <div className='buttonApp'>
                <Button title={'Затвердити'} />
            </div>

        </main>
    );
}


export default Approve;