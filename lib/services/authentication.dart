import 'package:firebase_auth/firebase_auth.dart';
import 'package:partagez_vos_50/models/AppUser.dart';

class AuthenticationService {
  //instancie firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser _userFromFirebaseUser(User? user) {
    // ignore: unnecessary_null_comparison
    if (user != null) {
      return AppUser(uid: user.uid);
    } else {
      return AppUser();
    }
  }

  //le stream vas te servir a recupere l'utilisateur courant ecoute les actions de l'utilisateur
  Stream<AppUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //methode a appeler pour cree un compte
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'user-not-found';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'wrong-password';
      }
    }
  }

  //methode a appeler pour utiliser se connecter
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      // TODO store new user in fireStore

      return _userFromFirebaseUser(user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Le mot de passe est trop faible.');
        return "weak-password";
      } else if (e.code == 'email-already-in-use') {
        print('Un compte utilise deja cette email.');
        return "email-already-in-use";
      }
    } catch (e) {
      print(e.toString());
      return "Error";
    }
  }

  //methode appele pour deconnecter
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
