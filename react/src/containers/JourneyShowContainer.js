import React, { Component } from 'react';


class JourneyShowContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      journeys: null
    }
  }

  componentDidMount(){
    fetch(`/api/v1/journeys/${this.props.params.params}`)
    .then(response => {
      let parsed = response.json()
      return parsed
    }).then(body => {
      this.setState({ journeys: body })
    })
  }

  render() {
    let duration
    if (this.state.journeys !== null){
      duration = this.state.journeys.routes[0].legs[0].duration.text
    }
    return(
      <div>
        <p>{duration}</p>
      </div>
    )
  }
}
export default JourneyShowContainer;
