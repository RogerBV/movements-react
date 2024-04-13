// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth, GoogleAuthProvider } from "firebase/auth"
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyCN2k8WFL32EiyaMqc8uVUP4RSok9xs6e0",
  authDomain: "shoppinglist-46fa5.firebaseapp.com",
  projectId: "shoppinglist-46fa5",
  storageBucket: "shoppinglist-46fa5.appspot.com",
  messagingSenderId: "157357374466",
  appId: "1:157357374466:web:bb3a0505ef7043cef93b1b"
};

// Initialize Firebase
export const appFirebase = initializeApp(firebaseConfig);
export const auth = getAuth(appFirebase)
export const provider = new GoogleAuthProvider()
