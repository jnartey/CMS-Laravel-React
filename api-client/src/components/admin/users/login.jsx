import React, { Component } from "react";
import { Redirect } from "react-router-dom";
import PropTypes from "prop-types";
import { withStyles, createMuiTheme } from "@material-ui/core/styles";
//import MarkdownElement from "@material-ui/docs/MarkdownElement";
import "./../admin.css";
import { NavLink } from "react-router-dom";

import Grid from "@material-ui/core/Grid";
import IconButton from "@material-ui/core/IconButton";
import Email from "@material-ui/icons/Email";
import Lock from "@material-ui/icons/Lock";

import Input from "@material-ui/core/Input";
import InputLabel from "@material-ui/core/InputLabel";
import InputAdornment from "@material-ui/core/InputAdornment";
import FormHelperText from "@material-ui/core/FormHelperText";
import FormControl from "@material-ui/core/FormControl";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import TextField from "@material-ui/core/TextField";
import Button from "@material-ui/core/Button";
import Checkbox from "@material-ui/core/Checkbox";
import Visibility from "@material-ui/icons/Visibility";
import VisibilityOff from "@material-ui/icons/VisibilityOff";
import Typography from "@material-ui/core/Typography";
//import { PostData } from "../../services/PostData";
import { Auth } from "../../Auth";
import Loader from "../../Loader";
import Snackbar from "@material-ui/core/Snackbar";
import { MySnackbarContentWrapper } from "../../../helpers/snackbar.helper";

const styles = theme => ({
  root: {
    flexGrow: 1,
    height: "100vh",
    padding: "0 8%"
  },
  loginContainer: {
    height: "100vh"
  },
  paper: {
    padding: theme.spacing.unit * 2,
    color: theme.palette.text.secondary
  },
  control: {
    padding: theme.spacing.unit * 2
  },
  button: {
    margin: theme.spacing.unit
  },
  textRight: {
    textAlign: "right"
  },
  marginTop: {
    marginTop: "0.5rem"
  }
});

const theme = createMuiTheme({
  typography: {
    useNextVariants: true
  }
});

class Login extends Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      emailError: false,
      emailErrorText: "",
      password: "",
      passwordError: false,
      passwordErrorText: "",
      remember_me: "",
      isLoggedIn: false,
      loading: true,
      messageType: "",
      message: "",
      openSnackbar: false
    };

    this.login = this.login.bind(this);
    this.onChange = this.onChange.bind(this);
  }

  componentDidMount() {
    this.setState({ loading: false });
  }

  validate() {
    let isError = false;
    const errors = {};

    if (this.state.email.trim() === "") {
      isError = true;
      errors.emailError = true;
      errors.emailErrorText = "Email is required";
    }

    if (this.state.email.indexOf("@") === -1) {
      isError = true;
      errors.emailError = true;
      errors.emailErrorText = "Email is invalid";
    }

    if (this.state.password.trim() === "") {
      isError = true;
      errors.passwordError = true;
      errors.passwordErrorText = "Password is required";
    }

    if (isError) {
      this.setState({ ...this.state, ...errors });
    }

    return isError;
  }

  login() {
    const err = this.validate();

    if (!err) {
      if (this.state.email && this.state.password) {
        this.setState({ loading: true });

        Auth.authenticate("login", this.state);

        if (sessionStorage.getItem("user")) {
          this.setState({ isLoggedIn: true, loading: false });
        } else {
          this.setState({
            loading: false,
            email: "",
            emailError: false,
            emailErrorText: "",
            password: "",
            passwordError: false,
            passwordErrorText: "",
            remember_me: "",
            openSnackbar: true,
            messageType: "error",
            message: "Invalid email or password!"
          });
        }
      }
    }
  }

  onChange(e) {
    this.setState({
      [e.target.name]: e.target.value
    });
    //console.log(this.state);
  }

  handleClickShowPassword = () => {
    this.setState(state => ({ showPassword: !state.showPassword }));
  };

  handleSnackbarClose = (event, reason) => {
    if (reason === "clickaway") {
      return;
    }

    this.setState({ openSnackbar: false });
  };

  render() {
    if (this.state.isLoggedIn) {
      return <Redirect to="/admin/dashboard" />;
    }

    const { loading } = this.state;
    const { classes } = this.props;

    // if (AuthService.isLoggedIn) {
    //   return <Redirect to="/admin/dashboard" />;
    // }

    return (
      <div>
        <Snackbar
          anchorOrigin={{
            vertical: "top",
            horizontal: "center"
          }}
          open={this.state.openSnackbar}
          autoHideDuration={6000}
          onClose={this.handleSnackbarClose}
        >
          <MySnackbarContentWrapper
            variant={this.state.messageType}
            className={classes.margin}
            message={this.state.message}
          />
        </Snackbar>
        {loading ? <Loader /> : ""}
        <Grid
          className={classes.loginContainer}
          container
          direction="row"
          justify="center"
          alignItems="center"
        >
          <Grid item sm={12} md={4} lg={3} xs={12} xl={3}>
            <FormControl fullWidth className={classes.margin}>
              <InputLabel htmlFor="input-with-icon-adornment">
                Your Email
              </InputLabel>
              <Input
                id="input-with-icon-adornment"
                name="email"
                label="Email"
                value={this.state.email}
                onChange={this.onChange}
                error={this.state.emailError}
                required={true}
                endAdornment={
                  <InputAdornment position="end">
                    <IconButton aria-label="Toggle visibility">
                      <Email />
                    </IconButton>
                  </InputAdornment>
                }
              />
              {this.state.emailError ? (
                <FormHelperText id="component-error-text">
                  {this.state.emailErrorText}
                </FormHelperText>
              ) : (
                ""
              )}
            </FormControl>
            <FormControl
              fullWidth
              className={(classes.margin, classes.marginTop)}
            >
              <InputLabel htmlFor="input-with-icon-adornment">
                Your Password
              </InputLabel>
              <Input
                id="adornment-password"
                type={this.state.showPassword ? "text" : "password"}
                name="password"
                label="Password"
                onChange={this.onChange}
                error={this.state.passwordError}
                required={true}
                endAdornment={
                  <InputAdornment position="end">
                    <IconButton
                      aria-label="Toggle password visibility"
                      onClick={this.handleClickShowPassword}
                    >
                      {this.state.showPassword ? (
                        <Visibility />
                      ) : (
                        <VisibilityOff />
                      )}
                    </IconButton>
                  </InputAdornment>
                }
              />
              {this.state.passwordError ? (
                <FormHelperText id="component-error-text">
                  {this.state.passwordErrorText}
                </FormHelperText>
              ) : (
                ""
              )}
            </FormControl>
            <Grid container direction="row" className={classes.marginTop}>
              <Grid
                className={classes.textLeft}
                item
                sm={12}
                md={6}
                lg={6}
                xs={6}
                xl={6}
              >
                <FormControlLabel
                  control={
                    <Checkbox
                      id="remember_me"
                      name="remember_me"
                      checked={this.state.isChecked}
                      onChange={this.onChange}
                      value="Remember me"
                      color="primary"
                    />
                  }
                  label="Remember me"
                />
              </Grid>
              <Grid
                className={classes.textRight}
                item
                sm={12}
                md={6}
                lg={6}
                xs={6}
                xl={6}
              >
                <Button
                  variant="contained"
                  color="primary"
                  onClick={this.login}
                  className={classes.button}
                >
                  Login
                </Button>
              </Grid>
            </Grid>
            <Typography variant="body2" gutterBottom>
              <NavLink to="/admin/login/reset-password">
                <span>Forgot your password?</span>
              </NavLink>
            </Typography>
          </Grid>
        </Grid>
      </div>
      // <div className="p-grid p-justify-center" style={{ height: "100vh" }}>
      //   <div className="p-sm-12 p-md-4 p-lg-3 p-xl-3 p-col-align-center">
      //     <div className="p-col-12">
      //       <div className="p-inputgroup">
      //         <span className="p-inputgroup-addon">
      //           <i className="pi pi-envelope" />
      //         </span>
      //         <InputText
      //           name="email"
      //           placeholder="Email"
      //           onChange={this.onChange}
      //         />
      //       </div>
      //     </div>
      //     <div className="p-col-12">
      //       <div className="p-inputgroup">
      //         <span className="p-inputgroup-addon">
      //           <i className="pi pi-lock" />
      //         </span>
      //         <Password
      //           id="password"
      //           name="password"
      //           value={this.state.value}
      //           onChange={this.onChange}
      //           placeholder="Password"
      //         />
      //       </div>
      //     </div>
      //     <div className="p-col p-grid">
      //       <div className="p-col-7">
      //         <Checkbox
      //           inputId="remember_me"
      //           name="remember_me"
      //           value="remember"
      //           checked={this.state.isChecked}
      //           onChange={this.onChange}
      //         />
      //         <label
      //           htmlFor="remember_me"
      //           className="p-checkbox-label remember-me"
      //         >
      //           Remember me
      //         </label>
      //       </div>
      //       <div className="p-col-5 text-right">
      //         <Button
      //           label="Login"
      //           className="p-button-raised p-button-secondary"
      //           onClick={this.login}
      //         />
      //       </div>
      //     </div>
      //     <div className="p-col-12">
      //       <div className="reset-password">
      //         <NavLink to="/admin/login/reset-password">
      //           <span>Forgot your password?</span>
      //         </NavLink>
      //       </div>
      //     </div>
      //   </div>
      // </div>
    );
  }
}

Login.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles)(Login);
