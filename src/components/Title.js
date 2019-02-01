import React, { Component } from 'react';


export default class Title extends Component {
    constructor(props) {
        super(props);
      }

    render() {
        return (
            <div className="title is-1 my-title">
                <h1>{this.props.msg[0]}</h1>
            </div>
        )
    }
}