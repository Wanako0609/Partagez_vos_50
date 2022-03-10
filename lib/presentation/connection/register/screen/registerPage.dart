import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/connection/register/widgets/account.dart';

import '../../../commun/appbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controleur
  var emailReturn = TextEditingController();
  var passwordReturn = TextEditingController();

  //step params
  int currentStep = 0;
  final isLastStep = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stepper(
          elevation: 0,

          //type de stepper
          type: StepperType.horizontal,
          //list de steps
          steps: getSteps(),
          //le step acctuel
          currentStep: currentStep,

          onStepContinue: () {
            if (currentStep < 2) {
              setState(() => currentStep += 1);
            } else {
              // TODO send information
              print("task finish");
            }
          },

          onStepCancel: () {
            if (currentStep > 0) {
              setState(() => currentStep -= 1);
            }
          },
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: const Text('Compte'),
          content: AccountWidget(
              emailReturn: emailReturn, passwordReturn: passwordReturn),
        ),
        Step(
            isActive: currentStep >= 1,
            title: const Text('Adresse'),
            content: Container(
              height: 200,
              width: 500,
              child: Text(emailReturn.text),
            )),
        Step(
            isActive: currentStep >= 2,
            title: const Text('Complete'),
            content: Container(
              height: 200,
              width: 500,
            )),
      ];
}
