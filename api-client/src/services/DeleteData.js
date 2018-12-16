import { Settings } from "../config/settings";

export function DeleteData(type, accessToken) {
  let BaseUrl = Settings.API_URL;

  return new Promise((resolve, reject) => {
    fetch(BaseUrl + type, {
      method: "DELETE",
      headers: {
        // "Access-Control-Allow-Origin": "http://hostdev:8888",
        // "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE",
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: "Bearer " + accessToken
      }
      //data: { id: id }
    })
      .then(response => response.json())
      .then(res => {
        resolve(res);
      })
      .catch(error => {
        reject(new Error(error.message));
      });
  });
}
