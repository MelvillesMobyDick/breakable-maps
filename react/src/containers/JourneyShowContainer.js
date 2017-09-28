import React, { Component } from 'react';


class JourneyShowContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      journey: null,
      trip: null,
      travelTime: null,
      message: ""
    }
  }

  componentDidMount(){
    fetch(`/api/v1/journeys/${this.props.params.params}`)
    .then(response => {
      let parsed = response.json()
      return parsed
    }).then(body => {
      this.setState({ journey: body.journey, trip: body.trip, travelTime: body.travel_time})
    })
  }

  render() {
    let mapsDuration
    if (this.state.trip !== null){
      mapsDuration = this.state.trip.routes[0].legs[0].duration.value
    }

    let durationText
    if (this.state.trip !== null){
      durationText = this.state.trip.routes[0].legs[0].duration.text
    }

    let yourDuration
    if (this.state.journey !== null){
      yourDuration = this.state.travelTime
    }

    if (mapsDuration > yourDuration) {
      this.state.message = "You're smarter"
    } else {
      this.state.message = "You're dumber"
    }

    return(
      <div>
        <p>Maps Travel time: {durationText}</p>
        <p>{this.state.message}</p>
      </div>
    )
  }
}
export default JourneyShowContainer;
