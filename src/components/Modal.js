import React, { Component } from "react";

export default class Modal extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className={this.props.end}>
        <div className="modal-background" />
        <div className="modal-card">
          <header className="modal-card-head">
            <p className="modal-card-title">Timer's ended</p>
            <button
              className="delete"
              aria-label="close"
              onClick={this.props.close}
            />
          </header>
          <section className="modal-card-body">
            <p>Have a break !</p>
          </section>
          <footer className="modal-card-foot">
            <button className="button is-success" onClick={this.props.restart}>
              Restart
            </button>
            <button className="button" onClick={this.props.close}>
              Cancel
            </button>
          </footer>
        </div>
      </div>
    );
  }
}
