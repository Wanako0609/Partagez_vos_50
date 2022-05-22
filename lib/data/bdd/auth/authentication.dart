import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partagez_vos_50/data/bdd/firestore/database_user.dart';
import 'package:partagez_vos_50/data/models/appuser.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  //instancie firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return AppUser(uid: user.uid, email: user.email);
    } else {
      return null;
    }
  }

  //le stream vas te servir a recupere l'utilisateur courant ecoute les actions de l'utilisateur
  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //methode a appeler pour cree un compte
  Future signInUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      return _userFromFirebaseUser(user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.', name: "Auth error");

        return 'user-not-found';
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.', name: "Auth error");
        return 'wrong-password';
      } else {
        log(e.toString(), name: "Auth error");
        return 'Error';
      }
    }
  }

  //not used
  Future changePassword(AppUser user, String password) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified) {
        await user.sendEmailVerification();
      }
      user?.updatePassword(password);
    } catch (e) {
      log("Password can't be changed " + e.toString(), name: "Auth error");
    }
  }

  //methode a appeler pour utiliser se connecter
  Future registerWithEmailAndPassword(
      AppUser appUser, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user == null) {
        throw Exception("No user found");
      } else {
        await DatabaseUsers(uid: user.uid).createUser(appUser);

        return _userFromFirebaseUser(user);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        log('Un compte utilise deja cette email.', name: "Auth error");
        return "email-already-in-use";
      } else {
        log(e.toString(), name: "Auth error");
        return "Error";
      }
    }
  }

  //methode appele pour deconnecter
  Future signOutUser() async {
    try {
      log("Deconnection reussit", name: "Auth");
      return await _auth.signOut();
    } catch (e) {
      log(e.toString(), name: "erreur deconnection");
      return null;
    }
  }

  Future signInWithGoogle(BuildContext context) async {
    // Appel un flux pour deconnecter
    final GoogleSignInAccount? googleUser = await GoogleSignIn()
        .signIn()
        .catchError((onError) => log(onError, name: "Auth error"));

    if (googleUser == null) {
      return null;
    }

    // Obtien les information de la requete
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    // cree un credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    //converti le credential en user firebase
    User? user = (await _auth.signInWithCredential(credential)).user;

    //test si l'utilisateur est null ou pas
    if (user == null) {
      return null;
    }

    // Message de connection
    log("Connection reussit", name: "Auth");
    Navigator.pushNamed(context, '/userProfil');
    FocusScope.of(context).unfocus();

    // cree la base de donne si n'existe pas
    await DatabaseUsers(uid: user.uid).hadCollection(user.email);

    // Une fois connecter return le AppUser
    return _userFromFirebaseUser(user);
  }
}
