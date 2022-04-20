import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partagez_vos_50/data/bdd/firestore/users_collec/database_user.dart';
import 'package:partagez_vos_50/data/models/AppUser.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time/time.dart';

import '../../../presentation/commun/customToast.dart';

class AuthenticationService {
  //instancie firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return AppUser(uid: user.uid);
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
        print('No user found for that email.');
        return 'user-not-found';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'wrong-password';
      } else {
        print(e.toString());
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
      print("Password can't be changed " + e.toString());
    }
  }

  Future<void> deleteUser(AppUser user) async {
    try {
      await DatabaseUsers(uid: user.uid).dataDeleteUser();
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
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
        print('Un compte utilise deja cette email.');
        return "email-already-in-use";
      } else {
        print(e.toString());
        return "Error";
      }
    }
  }

  //methode appele pour deconnecter
  Future signOutUser() async {
    try {
      print("Deconnection reussit");
      return await _auth.signOut();
    } catch (e) {
      print("erreur deconnection");
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle(BuildContext context) async {
    // Appel un flux pour deconnecter
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ).signIn().catchError((onError) => print(onError));

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
    print("Connection reussit");
    await 1.seconds.delay;
    Navigator.pushNamed(context, '/');
    successToast(
        context, "Connexion reussit", "Connecté avec \n ${user.email}");
    FocusScope.of(context).unfocus();

    // cree la base de donne si n'existe pas
    await DatabaseUsers(uid: user.uid).hadCollection();

    // Une fois connecter return le AppUser
    return _userFromFirebaseUser(user);
  }
}
