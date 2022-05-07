import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:partagez_vos_50/data/models/Addresse.dart';
import 'package:partagez_vos_50/data/models/AppUser.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
import 'package:partagez_vos_50/presentation/connection/register/widgets/account.dart';
import 'package:partagez_vos_50/presentation/connection/register/widgets/addressLocation.dart';
import 'package:partagez_vos_50/presentation/connection/register/widgets/verify.dart';
import 'package:time/time.dart';

import '../../../../data/bdd/auth/authentication.dart';
import '../../../commun/appbar.dart';
import '../../../commun/button.dart';
import '../../../commun/customToast.dart';

//controleur
var emailReturn = TextEditingController();
var passwordReturn = TextEditingController();
var rueReturn = TextEditingController();
var postalCodeReturn = TextEditingController();
var villeReturn = TextEditingController();
var prenomReturn = TextEditingController();
var nomReturn = TextEditingController();

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  LinearGradient gradientSignInGoogle = const LinearGradient(
      colors: [Colors.blue, Color.fromARGB(255, 47, 84, 148)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);

  LinearGradient backGradient = const LinearGradient(
      colors: [mBackgroundColor, mBackgroundColor],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  //init firebase auth
  final AuthenticationService _auth = AuthenticationService();
  //step params
  int currentStep = 0;
  final isLastStep = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Stepper(
          //type de stepper
          type: StepperType.horizontal,
          //list de steps
          steps: getSteps(),
          //le step acctuel
          currentStep: currentStep,
          //action continuer
          onStepContinue: () {
            if (currentStep == 0) {
              setState(() => currentStep += 1);
              testpassword();
            } else if (currentStep == 1) {
              setState(() => currentStep += 1);
            } else {
              // currentStep == 2
              sendInformation();
            }
          },

          //action retour
          onStepCancel: () {
            if (currentStep > 0) {
              setState(() => currentStep -= 1);
            }
          },
          //custom btn
          controlsBuilder: (context, ControlsDetails details) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentStep == 0
                        ? Container()
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: mMyButton(
                                  texte: "Retour",
                                  onpressed: details.onStepCancel,
                                  gradient: backGradient,
                                  textColor: mPrimaryColor,
                                  weight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ),
                    currentStep == isLastStep
                        ? Expanded(
                            child: mMyButton(
                                texte: "Enregistrement",
                                onpressed: details.onStepContinue),
                          )
                        : Expanded(
                            child: mMyButton(
                                texte: "Suite",
                                onpressed: details.onStepContinue),
                          ),
                  ],
                ),
                const Divider(thickness: 2),
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: mMyButton(
                    texte: "CONNEXION AVEC GOOGLE",
                    onpressed: () => _auth.signInWithGoogle(context),
                    gradient: gradientSignInGoogle,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Deja un compte ? ",
                      style: mTextBasic,
                    ),
                    TextButton(
                        onPressed: (() =>
                            Navigator.pushNamed(context, '/login')),
                        child: const Text(
                          "Se connecter",
                        )),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          state: currentStep <= 0 ? StepState.editing : StepState.complete,
          title: const Text(
            'Compte',
            style: mTextStepName,
          ),
          content: AccountWidget(
              emailReturn: emailReturn, passwordReturn: passwordReturn),
        ),
        Step(
          isActive: currentStep >= 1,
          state: currentStep <= 1 ? StepState.editing : StepState.complete,
          title: const Text(
            'Adresse',
            style: mTextStepName,
          ),
          content: AddressFormWidget(
              rueReturn: rueReturn,
              postalCodeReturn: postalCodeReturn,
              villeReturn: villeReturn,
              prenomReturn: prenomReturn,
              nomReturn: nomReturn),
        ),
        Step(
          isActive: currentStep >= 2,
          state: currentStep <= 2 ? StepState.editing : StepState.complete,
          title: const Text(
            'Complete',
            style: mTextStepName,
          ),
          content: VerifyPage(
            email: emailReturn.text,
            adresse: rueReturn.text,
            ville: villeReturn.text,
            codePostal: postalCodeReturn.text,
            nom: nomReturn.text,
            prenom: prenomReturn.text,
          ),
        ),
      ];

  void testpassword() {
    if (passwordReturn.text.length < 6) {
      warningToast(
          context, "Le mot de passe doit contenir minimum 6 caractere !");
    }
  }

  bool validInformation() {
    if (emailReturn.text.trim().isEmpty ||
        rueReturn.text.trim().isEmpty ||
        villeReturn.text.trim().isEmpty ||
        postalCodeReturn.text.trim().isEmpty ||
        nomReturn.text.trim().isEmpty ||
        prenomReturn.text.trim().isEmpty) {
      errorToast(context, "Il faut remplir tout les champs");
      return false;
    } else if (passwordReturn.text.trim().isEmpty ||
        passwordReturn.text.length < 6) {
      errorToast(
          context, "Le mot de passe doit contenir minimun 6 caracteres !");
      return false;
    } else if (nomReturn.text.length < 3) {
      errorToast(context, "Le nom doit contenir minimun 3 caracteres !");
      return false;
    } else if (prenomReturn.text.length < 3) {
      errorToast(context, "Le prenom doit contenir minimun 3 caracteres !");
      return false;
    } else {
      return true;
    }
  }

  Future<void> sendInformation() async {
    if (validInformation() == false) {
      return;
    } else {
      Address address = Address(
        rue: rueReturn.text,
        codePostal: postalCodeReturn.text,
        ville: villeReturn.text,
      );
      AppUser appUser = AppUser(
        nom: nomReturn.text,
        prenom: prenomReturn.text,
        address: address,
        email: emailReturn.text,
      );
      dynamic result = await _auth.registerWithEmailAndPassword(
          appUser, emailReturn.text, passwordReturn.text);
      if (result is String) {
        switch (result) {
          case 'email-already-in-use':
            errorToast(context, "Cette email est deja utilisée");
            break;
          case "Error":
            errorToast(context, "Contacter un administrateur");
            break;
        }
      } else {
        await 1.seconds.delay;
        Navigator.pushNamed(context, '/');
        successToast(context, "Felicitation", "Utilisateur bien crée !");
        FocusScope.of(context).unfocus();
      }
    }
  }
}
