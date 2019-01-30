import React, { Component } from 'react';


export default class Title extends Component {
    constructor(props) {
        super(props);
        this.state = {
          message: 'Time left...',
        }
      }
    render() {
        return (
            <h1 className="Title">{this.state.message}</h1>
        )
    }
}