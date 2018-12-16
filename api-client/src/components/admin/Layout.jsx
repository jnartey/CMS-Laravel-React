import Header from "./elements/header";
import Footer from "./elements/footer";
import React, { Component } from "react";
import { Redirect, Route } from "react-router-dom";
import { Auth } from "../Auth";

class Layout extends Component {
  render() {
    return (
      <div>
        {sessionStorage.getItem("user") ? <Header /> : ""}
        {this.props.children}
        <Footer />
      </div>
    );
  }
}

export default Layout;
