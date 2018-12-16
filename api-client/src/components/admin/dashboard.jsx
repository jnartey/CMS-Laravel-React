import React, { Component } from "react";
import { Redirect, Link } from "react-router-dom";
import PropTypes from "prop-types";
import Typography from "@material-ui/core/Typography";
import { withStyles, createMuiTheme } from "@material-ui/core/styles";

import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import Chip from "@material-ui/core/Chip";
import Button from "@material-ui/core/Button";
import Avatar from "@material-ui/core/Avatar";

import Dboard from "@material-ui/icons/Dashboard";
import SupervisorAccount from "@material-ui/icons/SupervisorAccountTwoTone";
import Lock from "@material-ui/icons/LockTwoTone";
import Pages from "@material-ui/icons/PagesTwoTone";

import Card from "@material-ui/core/Card";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";

import Loader from "../Loader";

const styles = theme => ({
  root: {
    flexGrow: 1
  },
  content: {
    flexGrow: 1,
    padding: "6rem 2rem"
  },
  paper: {
    padding: theme.spacing.unit * 4,
    color: theme.palette.text.secondary
  },
  toolbar: {
    display: "flex",
    alignItems: "center",
    justifyContent: "flex-end",
    padding: "0 8px",
    ...theme.mixins.toolbar
  },
  breadCrumbs: {
    marginBottom: "1rem"
  },
  update: {
    padding: "0rem 2rem"
  },
  chip: {
    marginRight: theme.spacing.unit
  },
  textCenter: {
    textAlign: "center"
  },
  dashIcon: {
    fontSize: "4.5rem"
  },
  dashLink: {
    display: "block",
    color: "#555555",
    textDecoration: "none",
    // border: "3px solid #cccccc",
    borderRadius: "5px",
    margin: "0 0.5rem 0.5rem 0"
  },
  card: {
    minWidth: 196,
    paddingTop: "1.5rem",
    paddingBottom: "1.5rem"
  },
  bullet: {
    display: "inline-block",
    margin: "0 2px",
    transform: "scale(0.8)"
  },
  title: {
    fontSize: 14
  },
  pos: {
    marginBottom: 12
  }
});

const theme = createMuiTheme({
  typography: {
    useNextVariants: true
  }
});

class Dashboard extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoggedIn: false,
      loading: true
    };
  }

  componentDidMount() {
    if (sessionStorage.getItem("user")) {
    } else {
      this.setState({ isLoggedIn: true });
      //this.setState({ loading: false });
    }
    this.setState({ loading: false });
    localStorage.setItem("pageTitle", "Dashboard");
  }

  render() {
    const { classes } = this.props;
    const { loading } = this.state;
    const bull = <span className={classes.bullet}>•</span>;
    // if (this.state.isLoggedIn) {
    //   return <Redirect to="/admin/login" />;
    // }

    return (
      <div>
        {loading ? (
          <Loader />
        ) : (
          <main className={classes.content}>
            <Grid className={classes.loginContainer} container direction="row">
              <Grid
                item
                className={classes.breadCrumbs}
                sm={12}
                md={9}
                lg={9}
                xs={12}
                xl={9}
              >
                <Chip
                  avatar={
                    <Avatar>
                      <Dboard />
                    </Avatar>
                  }
                  label="Dashboard"
                  className={classes.chip}
                />
              </Grid>
              <Grid item sm={12} md={8} lg={8} xs={12} xl={8}>
                <Grid className={classes.root} container direction="row">
                  <Grid
                    item
                    className={classes.textCenter}
                    sm={12}
                    md={4}
                    lg={3}
                    xs={12}
                    xl={3}
                  >
                    <Link className={classes.dashLink} to="/admin/users">
                      <Card className={classes.card}>
                        <CardContent>
                          <SupervisorAccount className={classes.dashIcon} />
                          <Typography variant="h6" component="h2">
                            User Accounts
                          </Typography>
                          <Typography component="p">
                            well meaning and kindly.
                            <br />
                            {'"a benevolent smile"'}
                          </Typography>
                        </CardContent>
                      </Card>
                    </Link>
                  </Grid>
                  <Grid
                    item
                    className={classes.textCenter}
                    sm={12}
                    md={4}
                    lg={3}
                    xs={12}
                    xl={3}
                  >
                    <Link
                      className={classes.dashLink}
                      to="/admin/user-privileges"
                    >
                      <Card className={classes.card}>
                        <CardContent>
                          <Lock className={classes.dashIcon} />
                          <Typography variant="h6" component="h2">
                            User Privileges
                          </Typography>
                          <Typography component="p">
                            well meaning and kindly.
                            <br />
                            {'"a benevolent smile"'}
                          </Typography>
                        </CardContent>
                      </Card>
                    </Link>
                  </Grid>
                  <Grid
                    item
                    className={classes.textCenter}
                    sm={12}
                    md={4}
                    lg={3}
                    xs={12}
                    xl={3}
                  >
                    <Link className={classes.dashLink} to="/admin/pages">
                      <Card className={classes.card}>
                        <CardContent>
                          <Pages className={classes.dashIcon} />
                          <Typography variant="h6" component="h2">
                            Pages
                          </Typography>
                          <Typography component="p">
                            well meaning and kindly.
                            <br />
                            {'"a benevolent smile"'}
                          </Typography>
                        </CardContent>
                      </Card>
                    </Link>
                  </Grid>
                </Grid>
              </Grid>
              <Grid
                className={classes.update}
                item
                sm={12}
                md={3}
                lg={3}
                xs={12}
                xl={3}
              >
                {/* <Typography variant="h6" component="h5">
                  Updates
                </Typography> */}
              </Grid>
            </Grid>
          </main>
        )}
      </div>
    );
  }
}

Dashboard.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles, { withTheme: true })(Dashboard);
