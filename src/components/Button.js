import React, { Component } from 'react';

export default class Button extends Component {
    constructor(props) {
        super(props);

    }


    render() {
        let up;
        let down;
        this.props.toggle ? up = <button className="button btn is-primary center is-rounded"
            onClick={() => this.props.changeSession(this.props.session + 1)}>+1</button> :
            up = <button className="button btn is-primary center is-rounded" disabled>+1</button>

        this.props.toggle ? down = <button className="button btn is-primary center is-light is-rounded"
            onClick={() => this.props.changeSession(this.props.session - 1)}>-1</button> :
            down = <button className="button btn is-primary center is-light is-rounded" disabled>-1</button>

        return (
            <div className="tile is-child my-btns is-2 notification">

                {up}

                <button className="button is-link is-rounded" onClick={this.props.toggleEvent}>
                    {this.props.start}
                </button>

                {down}
            </div>

        )
    }
}