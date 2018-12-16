import React, { Component } from "react";
import { BrowserRouter as Router } from "react-router-dom";
import NavRouteControl from "./components/NavRouteControl";
class App extends Component {
  render() {
    return (
      <Router>
        <NavRouteControl />
      </Router>
    );
  }
}

export default App;
