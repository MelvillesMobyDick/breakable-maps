import React from 'react';
import { Router, browserHistory, Route, IndexRoute } from 'react-router';
import JourneyShowContainer from './containers/JourneyShowContainer'

const App = props => {
  return(
    <Router history={browserHistory}>
      <Route path='/journeys/:params' component={JourneyShowContainer}/>
    </Router>
  )
}

export default App;
