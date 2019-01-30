import React, { Component } from 'react';

export default class Button extends Component {
    constructor(props) {
        super(props);

        this.state = {
            toggle: true,
            content: 'Start',
        }
        this.toggleEvent = this.toggleEvent.bind(this);
    }

    toggleEvent() {
        this.state.toggle ? this.props.start() : this.props.reset();
        this.state.toggle ? this.setState({ content: 'Reset' }) : this.setState({ content: 'Start' });
        this.state.toggle = !this.state.toggle;
    }
    
    

    render() {
        return (
            <div>
                <button className="button is-primary is-rounded" onClick={() => {this.props.onclick(this.props.session -1)}}>-1</button>
                <button className="button is-link is-rounded" onClick={this.toggleEvent}>
                    {this.state.content}
                </button>
                <button className="button is-primary is-rounded" onClick={() => {this.props.onclick(this.props.session +1)}}>+1</button>
            </div>

        )
    }
}