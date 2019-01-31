import React, { Component } from 'react';


export default class Title extends Component {
    constructor(props) {
        super(props);
      }

    render() {
        return (
            <div>
                <h1 className="Title">{this.props.msg[0]}</h1>
            </div>
        )
    }
}