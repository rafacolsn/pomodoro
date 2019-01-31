import React, { Component } from 'react';

export default class Modal extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (

            <div className={this.props.end}>
                <div className="modal-background"></div>
                <div className="modal-card">
                    <header className="modal-card-head">
                        <p className="modal-card-title">Timer's ended</p>
                        <button className="delete" aria-label="close"></button>
                    </header>
                    <section className="modal-card-body">
                        <p>Have a break !</p>
                        
                    </section>
                    <footer className="modal-card-foot">
                        <button className="button is-success">Launch break's timer</button>
                        <button className="button">Cancel</button>
                    </footer>
                </div>
            </div>
        )
    }
}