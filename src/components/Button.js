import React, { Component } from 'react';

export default class Button extends Component {
    constructor(props) {
        super(props);
        
    }


    render() {
        return (
            <div>
                <button className="button is-primary is-rounded" onClick={() => this.props.changeSession(this.props.session -1)}>-1</button>
                <button className="button is-link is-rounded" onClick={this.props.toggleEvent}>
                    {this.props.start}
                </button>
                <button className="button is-primary is-rounded" onClick={() => this.props.changeSession(this.props.session +1)}>+1</button>
            </div>

        )
    }
}