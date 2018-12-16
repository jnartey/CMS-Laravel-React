import React, { Component } from "react";
import { PostData } from "../services/PostData";

export const Auth = {
  isAuthenticated: false,
  authenticate(type, data) {
    PostData(type, data).then(result => {
      let reponseJSON = result;
      if (reponseJSON.data) {
        sessionStorage.setItem("user", JSON.stringify(reponseJSON.data));
        this.isAuthenticated = true;
      } else {
        this.isAuthenticated = false;
      }
    });
  },
  logout() {
    sessionStorage.setItem("user", "");
    sessionStorage.clear();
    this.isAuthenticated = false;
  }
};
