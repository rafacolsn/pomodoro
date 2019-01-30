import React, { Component } from 'react';
import Title from './Title';
import Header from './Header';
import Button from './Button';

export default class Timer extends Component {

  constructor(props) {
    super(props);
    this.state = {
      minutes: 20,
      seconds: '00',
      session: 0,
      interval: '',
      secondsLeft: 0,
    }
    this.startTimer = this.startTimer.bind(this);
    this.resetTimer = this.resetTimer.bind(this);
    this.changeSession = this.changeSession.bind(this);

  }

  decreaseSeconds() {
    this.seconds--;
    this.displayTime();

  }
  displayTime() {
    this.minutes = Math.floor(this.seconds / 60);
    this.secondsLeft = this.seconds % 60;
    this.minutes = this.minutes < 10 ? '0' + this.minutes : this.minutes;
    this.secondsLeft = this.secondsLeft < 10 ? '0' + this.secondsLeft : this.secondsLeft;

    this.setState({
      minutes: this.minutes,
      seconds: this.secondsLeft
    })
  }
  startTimer() {
    this.seconds = (this.state.session + this.state.minutes) * 60;

    this.interval = setInterval((this.decreaseSeconds.bind(this)), 1000);
  }

  resetTimer() {
    clearInterval(this.interval);
    this.setState({
      minutes: 20,
      seconds: '00'
    })
  }

  changeSession(newSession) {
    this.setState({
      session: newSession
    })
  }

  render() {
    return (
      <div className="App container">
        <Header />
        <Title />
        <div className="section box">
          <p>{this.state.session + this.state.minutes} : {this.state.seconds}</p>
          <Button start={this.startTimer} reset={this.resetTimer} session={this.state.session} onclick={this.changeSession}/>
          <progress className="progress is-medium is-danger" value={this.seconds} max={this.state.session*60}></progress>
        </div>
      </div>
    );
  }
}

