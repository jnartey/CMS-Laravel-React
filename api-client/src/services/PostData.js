import { Settings } from "../config/settings";

export function PostData(type, userData) {
  let BaseUrl = Settings.API_URL;

  return new Promise((resolve, reject) => {
    fetch(BaseUrl + type, {
      method: "POST",
      headers: {
        // "Access-Control-Allow-Origin": "http://hostdev:8888",
        // "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE",
        "Content-Type": "application/json",
        Accept: "application/json"
      },
      body: JSON.stringify(userData)
    })
      .then(response => response.json())
      .then(res => {
        resolve(res);
      })
      .catch(error => {
        reject(error);
        console.log(error);
      });
  });
}
