var admin = require("firebase-admin");
import * as credentials from "./fire-adm.json";

export default async function initAdmin() {
  
  if (admin.apps.length > 0) {
    return admin.app();
  }

 
  return admin.initializeApp({
    credential:admin.credential.cert(credentials),
    projectId: "garbage-driver-app",
   
  });
}
