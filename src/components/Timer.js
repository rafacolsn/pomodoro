import React, { Component } from 'react';
import Title from './Title';
import Header from './Header';
import Button from './Button';
import Modal from './Modal';

export default class Timer extends Component {

  constructor(props) {
    super(props);
    this.state = {
      seconds: '00', //initialized as string to be well displayed
      session: 0, // to increment the timer
      interval: '', // to stop the timer
      secondsLeft: '00', // will be used to display in a range of 60
      minutesLeft: 20, // default value
      toggle: true, // for the start/reset button toggle
      content: 'Start', // content of the button
      progress: 100, // for the progress bar max
      inProgress: 100, // for the progress bar value
      message: [
        'Start a work session',
        'Good Work !',
        'Time left...'
      ],
      endTime: 'modal',
      audio: ''
    }

    // these functions are bound to be called in children components
    this.startTimer = this.startTimer.bind(this);
    this.resetTimer = this.resetTimer.bind(this);
    this.changeSession = this.changeSession.bind(this);
    this.toggleEvent = this.toggleEvent.bind(this);
  }

  decreaseSeconds() { //decrement seconds
    this.seconds--;
    this.inProgress = this.seconds;
    this.displayTime();
    this.alertEndTime();
  }

  displayTime() { // format time for a well display
    this.minutesLeft = Math.floor(this.seconds / 60);
    this.secondsLeft = this.seconds % 60;
    this.minutesLeft = this.minutesLeft < 10 ? '0' + this.minutesLeft : this.minutesLeft;
    this.secondsLeft = this.secondsLeft < 10 ? '0' + this.secondsLeft : this.secondsLeft;

    this.setState({
      minutesLeft: this.minutesLeft,
      secondsLeft: this.secondsLeft
    })
  }

  startTimer() {
    this.seconds = this.state.minutesLeft * 60; // all the seconds that are remaining
    this.progress = this.seconds; // set the pogress bar max to the all seconds 
    this.inProgress = this.seconds; // set the pogress bar value to the all seconds 
    this.interval = setInterval((this.decreaseSeconds.bind(this)), 1000); // stock the inerval's value and call function to decrease time
  }

  resetTimer() { // to reset timer
    clearInterval(this.interval);
    this.setState({
      minutesLeft: 20,
      secondsLeft: '00',
    })
    this.progress = 100;
    this.inProgress = 100; // reset bar progress
  }

  toggleEvent() { // toggle button 
    this.state.toggle ? this.startTimer() : this.resetTimer();
    this.state.toggle ? this.setState({ content: 'Reset' }) : this.setState({ content: 'Start' });
    this.state.toggle = !this.state.toggle;
  }

  changeSession(newSession) { // to in/de_crement the timer
    this.session = newSession;
    if (newSession != 0) {
      this.state.minutesLeft += newSession;
    }
    this.setState({
      session: 0,
    })
  }

  alertEndTime() {
    if (this.seconds < 50) {
      const sound = new Audio('../../assets/sound/Electric alarm clock sound effect.mp3');
      sound.play();
    }
    if (this.seconds < 1) {
      this.resetTimer();
      this.setState({
        endTime: 'modal is-active'
      })
    }
  }

  render() {
    return (
      <div className="App container">
        <Header />
        <Title msg={this.state.message} />
        <div className="section box">
          <p>{this.state.minutesLeft} : {this.state.secondsLeft}</p>
          <Button session={this.state.session} changeSession={this.changeSession} toggleEvent={this.toggleEvent} toggle={this.state.toggle} start={this.state.content} />
          <progress className="progress is-medium is-danger" value={this.inProgress} max={this.progress}></progress>
          <div>{this.state.audio}</div>
          <Modal end={this.state.endTime} />
        </div>

      </div>
    );
  }
}

