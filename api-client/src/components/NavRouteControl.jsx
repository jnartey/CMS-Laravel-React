import React from "react";
import styled from "styled-components";
import { Switch, Route, withRouter } from "react-router-dom";
import { TransitionGroup, CSSTransition } from "react-transition-group";
import history from "./history";
import PrivateRoute from "./PrivateRoute";

import AdminLogin from "./admin/users/login";
import Dashboard from "./admin/dashboard";
import Logout from "./admin/users/logout";
import Users from "./admin/users/index";
import ViewUser from "./admin/users/view";
import AdminLayout from "./admin/Layout";
import Home from "./site/Home";
import Layout from "./admin/Layout";

function NavControl({ location }) {
  return (
    <Wrapper>
      <TransitionGroup className="transition-group">
        <CSSTransition
          key={location.key}
          timeout={{ enter: 300, exit: 300 }}
          classNames="fade"
        >
          <section className="route-section">
            <Switch location={location}>
              <Route exact path="/home" component={Home} />
              <Route path="/admin/login" component={AdminLogin} />
              <Route path="/admin/logout" component={Logout} />
              <AdminLayout>
                <PrivateRoute path="/admin/dashboard" component={Dashboard} />
                <PrivateRoute path="/admin/users" component={Users} />
                <PrivateRoute
                  path="/admin/users/view/:id"
                  component={ViewUser}
                />
              </AdminLayout>
            </Switch>
          </section>
        </CSSTransition>
      </TransitionGroup>
    </Wrapper>
  );
}

const Wrapper = styled.div`
  .fade-enter {
    opacity: 0.01;
  }
  .fade-enter.fade-enter-active {
    opacity: 1;
    transition: opacity 300ms ease-in;
  }
  .fade-exit {
    opacity: 1;
  }

  .fade-exit.fade-exit-active {
    opacity: 0.01;
    transition: opacity 300ms ease-in;
  }

  div.transition-group {
    position: relative;
  }
  section.route-section {
    position: absolute;
    width: 100%;
    top: 0;
    left: 0;
  }
`;

export default withRouter(NavControl);
