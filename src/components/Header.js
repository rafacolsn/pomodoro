import React, { Component } from 'react';
import logo from '../../assets/img/pomodoro-timer.png';

export default class Header extends Component {
    constructor(props) {
        super(props);
        this.state = {

        }
    }
    render() {
        return (
            <nav className="navbar">
                <figure className="image is-128x128"><img src={logo} alt="pomodoro" /></figure>
            </nav>
        )
    }
}