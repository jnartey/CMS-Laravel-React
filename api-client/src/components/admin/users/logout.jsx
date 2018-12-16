import React, { Component } from "react";
import { Redirect } from "react-router-dom";

class Logout extends Component {
  componentDidMount() {
    this.logout();
  }

  constructor(props) {
    super(props);
    this.state = {
      redirect: false
    };

    this.logout = this.logout.bind(this);
  }

  logout() {
    sessionStorage.setItem("user", "");
    sessionStorage.clear();
    this.setState({ redirect: true });
  }

  render() {
    if (this.state.redirect) {
      return <Redirect to="/admin/login" />;
    }
    return <div />;
  }
}

export default Logout;
