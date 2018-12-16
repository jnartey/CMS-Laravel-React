import React, { Component } from "react";
import { Redirect, Link } from "react-router-dom";
import PropTypes from "prop-types";
import { withStyles } from "@material-ui/core/styles";
import { createMuiTheme } from "@material-ui/core/styles";

import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import IconButton from "@material-ui/core/IconButton";
import Button from "@material-ui/core/Button";
import MenuIcon from "@material-ui/icons/Menu";
import AccountCircle from "@material-ui/icons/AccountCircleOutlined";
import MenuItem from "@material-ui/core/MenuItem";
import Menu from "@material-ui/core/Menu";
import Badge from "@material-ui/core/Badge";
import NotificationsIcon from "@material-ui/icons/NotificationsOutlined";
import CssBaseline from "@material-ui/core/CssBaseline";
import classNames from "classnames";

import Drawer from "@material-ui/core/Drawer";
import List from "@material-ui/core/List";
import Divider from "@material-ui/core/Divider";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";
import SupervisorAccount from "@material-ui/icons/SupervisorAccountOutlined";
import Settings from "@material-ui/icons/SettingsOutlined";
import Power from "@material-ui/icons/PowerSettingsNewTwoTone";
import Dashboard from "@material-ui/icons/DashboardOutlined";
import Lock from "@material-ui/icons/LockOutlined";
import Pages from "@material-ui/icons/PagesOutlined";
import ListSubheader from "@material-ui/core/ListSubheader";

import { GetData } from "../../../services/GetData";

const styles = theme => ({
  root: {
    flexGrow: 1
  },
  grow: {
    flexGrow: 1
  },
  toolBar: {
    minHeight: 58
  },
  menuButton: {
    marginLeft: -12,
    marginRight: 20
  },
  leftIcon: {
    marginRight: "0.5rem"
  },
  icon: {
    marginRight: "0"
  },
  subHeader: {
    lineHeight: "20px",
    marginTop: "1rem"
  },
  list: {
    width: 250
  },
  chip: {
    margin: theme.spacing.unit
  }
});

const theme = createMuiTheme({
  typography: {
    useNextVariants: true
  }
});

class Header extends Component {
  componentWillMount() {
    let user = sessionStorage.getItem("user");

    if (sessionStorage.getItem("user")) {
      this.setState({
        redirect: false
      });
    }
  }

  state = {
    anchorEl: null,
    left: false,
    redirect: true,
    userData: []
  };

  handleMenu = event => {
    this.setState({ anchorEl: event.currentTarget });
  };

  handleClose = () => {
    this.setState({ anchorEl: null });
  };

  toggleDrawer = (side, open) => () => {
    this.setState({
      [side]: open
    });
  };

  handleClick = () => {
    this.setState(state => ({ open: !state.open }));
  };

  constructor(props) {
    super(props);
    let user = sessionStorage.getItem("user");
    const userCredentials = JSON.parse(user);

    this.state = {
      userData: userCredentials
    };

    this.logout = this.logout.bind(this);
  }

  logout() {
    sessionStorage.setItem("user", "");
    sessionStorage.clear();

    GetData("logout", this.state.userData.token).then(result => {
      let reponseJSON = result;
      if (reponseJSON.data) {
        this.setState({ data: reponseJSON.data });
        this.setState({ redirect: true });
        //console.log(reponseJSON.data);
      } else {
      }
    });
  }

  render() {
    const { classes, theme } = this.props;
    const { anchorEl } = this.state;
    const open = Boolean(anchorEl);

    // if (!isLoggedIn) {
    //   return <Redirect to="/admin/login" />;
    // }

    const sideList = (
      <div className={classes.list}>
        <List
          component="div"
          disablePadding
          subheader={
            <ListSubheader className={classes.subHeader}>Menu</ListSubheader>
          }
        >
          <ListItem
            button
            className={classes.nested}
            component={Link}
            to={"/admin/dashboard"}
          >
            <ListItemIcon className={classes.icon}>
              <Dashboard />
            </ListItemIcon>
            <ListItemText inset primary="Dashboard" />
          </ListItem>
        </List>
        <List
          component="div"
          disablePadding
          subheader={
            <ListSubheader className={classes.subHeader}>
              User Accounts Settings
            </ListSubheader>
          }
        >
          <ListItem
            button
            className={classes.nested}
            component={Link}
            to={"/admin/users"}
          >
            <ListItemIcon className={classes.icon}>
              <SupervisorAccount />
            </ListItemIcon>
            <ListItemText inset primary="User Accounts" />
          </ListItem>
          <ListItem
            button
            className={classes.nested}
            component={Link}
            to={"/admin/user-privileges"}
          >
            <ListItemIcon className={classes.icon}>
              <Lock />
            </ListItemIcon>
            <ListItemText inset primary="User Privileges" />
          </ListItem>
        </List>
        <List
          component="div"
          disablePadding
          subheader={
            <ListSubheader className={classes.subHeader}>
              Site Administration
            </ListSubheader>
          }
        >
          <ListItem
            button
            className={classes.nested}
            component={Link}
            to={"/admin/pages"}
          >
            <ListItemIcon className={classes.icon}>
              <Pages />
            </ListItemIcon>
            <ListItemText inset primary="Pages" />
          </ListItem>
        </List>
      </div>
    );

    return (
      <div className={classes.root}>
        <CssBaseline />
        <AppBar
          position="fixed"
          className={classNames(classes.appBar, {
            [classes.appBarShift]: this.state.open
          })}
        >
          <Toolbar className={classes.toolBar}>
            <IconButton
              className={classes.menuButton}
              color="inherit"
              onClick={this.toggleDrawer("left", true)}
            >
              <MenuIcon />
            </IconButton>
            <Typography variant="h6" color="inherit" className={classes.grow}>
              {localStorage.getItem("pageTitle")}
            </Typography>
            <div>
              <IconButton color="inherit">
                <Badge badgeContent={0} color="secondary">
                  <NotificationsIcon />
                </Badge>
              </IconButton>
              <Button
                aria-owns={open ? "menu-appbar" : undefined}
                aria-haspopup="true"
                onClick={this.handleMenu}
                color="inherit"
              >
                <AccountCircle className={classes.leftIcon} />
                {this.state.userData.first_name +
                  " " +
                  this.state.userData.last_name}
              </Button>
              <Menu
                id="menu-appbar"
                anchorEl={anchorEl}
                anchorOrigin={{
                  vertical: "top",
                  horizontal: "right"
                }}
                transformOrigin={{
                  vertical: "top",
                  horizontal: "right"
                }}
                open={open}
                onClose={this.handleClose}
              >
                <MenuItem
                  component={Link}
                  to={"/admin/account/" + this.state.userData.id}
                >
                  <ListItemIcon className={classes.icon}>
                    <Settings />
                  </ListItemIcon>
                  <ListItemText
                    classes={{ primary: classes.primary }}
                    inset
                    primary="My Account"
                  />
                </MenuItem>
                <MenuItem component={Link} to={"/admin/logout"}>
                  <ListItemIcon className={classes.icon}>
                    <Power />
                  </ListItemIcon>
                  <ListItemText
                    classes={{ primary: classes.primary }}
                    inset
                    primary="Logout"
                  />
                </MenuItem>
              </Menu>
            </div>
          </Toolbar>
        </AppBar>
        <Drawer
          open={this.state.left}
          onClose={this.toggleDrawer("left", false)}
        >
          <div
            tabIndex={0}
            role="button"
            onClick={this.toggleDrawer("left", false)}
            onKeyDown={this.toggleDrawer("left", false)}
          >
            {sideList}
          </div>
        </Drawer>
        : ""}
      </div>
    );
  }
}

Header.propTypes = {
  classes: PropTypes.object.isRequired,
  theme: PropTypes.object.isRequired
};

export default withStyles(styles, { withTheme: true })(Header);
