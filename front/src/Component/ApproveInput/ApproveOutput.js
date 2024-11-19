import React from "react";
import './ApproveOutput.css';




const ApproveInput = (props) => {
    return (
        <div className="approveForm">
            {props.approve.map((el) => (
                <div className='aprover' key={el.id}>
                    <h3>Затвердження</h3>
                    <div className='aproveR'>
                        <div className="aproveReview">
                            <h5>Протокол засідання Комісії</h5>
                            <div className='committeDateAndNumber'>
                                <p><b>№ </b>{el.committeMNNumber}</p>
                                <p><b>Дата:</b> {el.committeMNDate}</p>
                            </div>
                        </div>
                        <div className="aproveReview">
                            <h5>Протокол засідання Вченої ради</h5>
                            <div className='committeDateAndNumber'>
                                <p><b>№</b> {el.committeSCNumber}</p>
                                <p><b>Дата:</b> {el.committeSCDate}</p>
                            </div>
                        </div>
                        <div className="aproveReview">
                            <h5>Наказ про утвердження</h5>
                            <div className='committeDateAndNumber'>
                                <p><b>№</b> {el.orderNumber}</p>
                                <p><b>Дата:</b> {el.orderDate}</p>
                            </div>
                        </div>
                    </div>
                    <div className='resolution'>
                        <h5>Ухвала комісії</h5>
                        <p>{el.resolution}</p>
                    </div>
                </div>
            ))
        }
        </div>

    )
}

export default ApproveInput;