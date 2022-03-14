import 'package:firebase_auth/firebase_auth.dart';
import 'package:partagez_vos_50/data/bdd/firestore/users_collec/database_user.dart';
import 'package:partagez_vos_50/data/models/AppUser.dart';

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
}
