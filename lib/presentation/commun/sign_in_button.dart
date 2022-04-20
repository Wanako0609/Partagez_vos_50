import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:sign_button/sign_button.dart';

import '../../data/bdd/auth/authentication.dart';

final AuthenticationService auth = AuthenticationService();

SignInButton myGoogleSignInButton(BuildContext context) {
  return SignInButton(
      buttonType: ButtonType.google,
      btnTextColor: Colors.white,
      btnColor: mSecondColor,
      btnText: "Connexion avec Google",
      width: 220,
      onPressed: () {
        auth.signInWithGoogle(context);
      });
}
