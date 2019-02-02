import React, { Component } from 'react';

export default (props) => {
    return (
        <audio src={props.source} autoPlay type="audio/mp3"></audio>
    )
}
