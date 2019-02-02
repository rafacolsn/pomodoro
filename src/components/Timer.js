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
      minutes: 20,
      session: 0, // to increment the timer
      interval: '', // to stop the timer
      secondsLeft: '00', // will be used to display in a range of 60
      minutesLeft: 20, // default value
      toggle: true, // for the start/reset button toggle
      content: 'Start', // content text of the button
      progress: 100, // for the progress bar max
      inProgress: 100, // for the progress bar value
      message: [
        'Start a work session',
        'Good Work ! Time left... ',
      ],
      endTime: 'modal',
      audio: ''
    }

    // these functions are bound to be called in children components
    this.startTimer = this.startTimer.bind(this);
    this.resetTimer = this.resetTimer.bind(this);
    this.changeSession = this.changeSession.bind(this);
    this.toggleEvent = this.toggleEvent.bind(this);
    this.restart = this.restart.bind(this);
    this.closeModal = this.closeModal.bind(this);
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
    this.state.interval = setInterval((this.decreaseSeconds.bind(this)), 1000); // stock the inerval's value and call function to decrease time
  }

  resetTimer() { // to reset timer
    clearInterval(this.state.interval);
    this.setState({
      minutesLeft: this.state.minutes,
      secondsLeft: '00',
      toggle: true,
    })
    this.progress = 100;
    this.inProgress = 100; // reset bar progress
  }

  toggleEvent() { // toggle button 
    console.log(this.state.toggle);
    this.state.toggle ? this.startTimer() : this.resetTimer();
    this.state.toggle ? this.setState({ content: 'Reset' }) : this.setState({ content: 'Start' });
    this.state.toggle = !this.state.toggle;
  }

  changeSession(newSession) { // to in/de_crement the timer
    this.session = newSession;
    if (newSession != 0) {
      this.setState((state) => ({
        minutes: state.minutes += newSession,
        minutes: state.minutes,
        minutesLeft: state.minutes < 10 ? '0' + state.minutes : state.minutes
      }))
    }
    this.setState({
      session: 0,
    })

  }

  alertEndTime() {
    if (this.seconds < 115 && this.state.toggle == false) {
      this.resetTimer();
      this.setState({
        endTime: 'modal is-active'
      })
    }
  }

  closeModal() {
    this.setState({
      content: 'Start',
      endTime: 'modal',
    });
    this.resetTimer();
  }

  restart() {
    this.setState({ toggle: false });
    this.closeModal();
    this.resetTimer();
    this.toggleEvent();
    this.setState({ toggle: false });

  }

  render() {
    let msg;
    if (this.state.toggle) {
      msg = this.state.message[0];
    }
    else {
      msg = this.state.message[1];
    }

    return (

      <div className="App">
        <div><Header /></div>
        <div className="container">
          <Title msg={msg} />
          <div className="tile is-ancestor center">
            <div className="tile is-parent is-vertical notification is-warning is-10" >
              <div className="tile center">
                <div className="tile is-child notification clock is-8">
                  <p className="subtitle timer" >{this.state.minutesLeft} : {this.state.secondsLeft}</p>
                </div>
                <Button session={this.state.session} changeSession={this.changeSession} toggle={this.state.toggle} toggleEvent={this.toggleEvent} start={this.state.content} />
              </div>
              <div className="tile bar is-parent is-10">
                <progress className="progress is-medium is-danger" value={this.inProgress} max={this.progress}></progress>
              </div>
              <Modal end={this.state.endTime} restart={this.restart} close={this.closeModal} />
            </div>
          </div>
        </div>
      </div>
    );
  }
}

