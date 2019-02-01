import React, { Component } from 'react';

export default class Button extends Component {
    constructor(props) {
        super(props);
        
    }


    render() {
        return (
            <div className="tile is-child my-btn is-2 notification">
                <button className="button center is-light is-rounded" onClick={() => this.props.changeSession(this.props.session -1)}>-1</button>
                <button className="button is-link is-rounded" onClick={this.props.toggleEvent}>
                    {this.props.start}
                </button>
                <button className="button center is-light is-rounded" onClick={() => this.props.changeSession(this.props.session +1)}>+1</button>
            </div>

        )
    }
}