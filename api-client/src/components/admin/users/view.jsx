import React, { Component } from "react";
import { Redirect, Link } from "react-router-dom";
import { createMuiTheme } from "@material-ui/core/styles";
import PropTypes from "prop-types";
import Typography from "@material-ui/core/Typography";
import { withStyles } from "@material-ui/core/styles";
import classNames from "classnames";

import Grid from "@material-ui/core/Grid";
import Button from "@material-ui/core/Button";
import Paper from "@material-ui/core/Paper";
import Chip from "@material-ui/core/Chip";
import Avatar from "@material-ui/core/Avatar";
import SupervisorAccount from "@material-ui/icons/SupervisorAccount";
import Dboard from "@material-ui/icons/Dashboard";
import PermIdentity from "@material-ui/icons/PermIdentity";
import Pageview from "@material-ui/icons/PageviewOutlined";
import Edit from "@material-ui/icons/EditOutlined";
import Delete from "@material-ui/icons/DeleteOutlined";
import SaveIcon from "@material-ui/icons/SaveOutlined";
import CancelIcon from "@material-ui/icons/CancelOutlined";
import Snackbar from "@material-ui/core/Snackbar";
import { MySnackbarContentWrapper } from "../../../helpers/snackbar.helper";

//Table Imports
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TablePagination from "@material-ui/core/TablePagination";
import TableRow from "@material-ui/core/TableRow";
import TableSortLabel from "@material-ui/core/TableSortLabel";
import Toolbar from "@material-ui/core/Toolbar";
import Checkbox from "@material-ui/core/Checkbox";
import IconButton from "@material-ui/core/IconButton";
import Tooltip from "@material-ui/core/Tooltip";
import DeleteIcon from "@material-ui/icons/DeleteOutlined";
import FilterListIcon from "@material-ui/icons/FilterList";
import AddIcon from "@material-ui/icons/Add";
import AutoRenewIcon from "@material-ui/icons/AutorenewOutlined";
import { lighten } from "@material-ui/core/styles/colorManipulator";

//Form dialog imports
import TextField from "@material-ui/core/TextField";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import FilledInput from "@material-ui/core/FilledInput";
import InputLabel from "@material-ui/core/InputLabel";
import MenuItem from "@material-ui/core/MenuItem";

//Form validation imports
import {
  ValidatorForm,
  TextValidator,
  SelectValidator
} from "react-material-ui-form-validator";

//Get data import
// import { GetData } from "../../../services/GetData";
// import { PostData } from "../../../services/PostData";
// import { PostDataAuth } from "../../../services/PostDataAuth";
// import { DeleteData } from "../../../services/DeleteData";
// import { generatePassword } from "../../../helpers/password.generator";

//Loader import
import Loader from "../../Loader";

//General styles
const styles = theme => ({
  root: {
    width: "100%",
    marginTop: theme.spacing.unit * 3
  },
  content: {
    flexGrow: 1,
    padding: "6rem 1.5rem"
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
  textRight: {
    textAlign: "right"
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
  table: {
    minWidth: 1020
  },
  tableWrapper: {
    overflowX: "auto"
  },
  dialogAction: {
    padding: "0 20px 20px",
    margin: "14px 0 0"
  },
  padRight: {
    paddingRight: "0.35rem"
  },
  padLeft: {
    paddingLeft: "0.35rem"
  },
  buttonMargin: {
    margin: "0.7rem 0 0",
    paddingLeft: "0.8rem"
  }
  //   button: {
  //     minWidth: "32px"
  //   }
});

class View extends Component {
  state = {};

  componentWillMount() {
    if (sessionStorage.getItem("user")) {
      let user = sessionStorage.getItem("user");
    } else {
      this.setState({ redirect: true });
    }
  }

  componentDidMount() {
    this._isMounted = true;
    let user = sessionStorage.getItem("user");
    const userCredentials = JSON.parse(user);
    localStorage.setItem(
      "pageTitle",
      "User | " + userCredentials.first_name + " " + userCredentials.last_name
    );
  }

  constructor(props) {
    super(props);
    let user = sessionStorage.getItem("user");
    const userCredentials = JSON.parse(user);
    console.log(userCredentials);

    this.state = {
      redirect: false,
      order: "asc",
      orderBy: "name",
      selected: [],
      data: [],
      page: 0,
      userData: userCredentials,
      rowsPerPage: 5,
      loading: true,
      open: false,
      _isMounted: false,
      showPassword: false,
      openSnackbar: false,
      messageType: "",
      message: "",
      deleted: false,
      alertTitle: "",
      alertMessage: "",
      toDelete: "",
      formData: {
        first_name: "",
        last_name: "",
        email: "",
        username: "",
        password: "",
        role_id: ""
      }
    };
  }

  render() {
    const { classes } = this.props;

    return (
      <main className={classes.content}>
        <Grid className={classes.loginContainer} container direction="row">
          <Grid item sm={12} md={10} lg={10} xs={12} xl={10}>
            <Grid className={classes.loginContainer} container direction="row">
              <Grid item className={classes.breadCrumbs} xs={10}>
                <Chip
                  avatar={
                    <Avatar>
                      <Dboard />
                    </Avatar>
                  }
                  label="Dashboard"
                  color="primary"
                  className={classes.chip}
                  component={Link}
                  onClick={e => {
                    e.stopPropagation();
                  }}
                  to={"/admin/dashboard"}
                />
                <Chip
                  avatar={
                    <Avatar>
                      <SupervisorAccount />
                    </Avatar>
                  }
                  label={
                    this.state.userData.first_name +
                    " " +
                    this.state.userData.last_name
                  }
                  className={classes.chip}
                />
              </Grid>
            </Grid>
          </Grid>
        </Grid>
      </main>
    );
  }
}

View.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles, { withTheme: true })(View);
