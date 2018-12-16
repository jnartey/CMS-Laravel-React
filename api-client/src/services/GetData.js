import { Settings } from "../config/settings";

export function GetData(type, accessToken) {
  let BaseUrl = Settings.API_URL;

  return new Promise((resolve, reject) => {
    fetch(BaseUrl + type, {
      method: "GET",
      headers: {
        // "Access-Control-Allow-Origin": "http://hostdev:8888",
        // "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE",
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + accessToken
      }
    })
      .then(response => response.json())
      .then(responseJson => {
        //console.log(responseJson);
        resolve(responseJson);
      })
      .catch(error => {
        reject(error);
      });
  });
}
