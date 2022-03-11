import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';
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
        padding: const EdgeInsets.only(top: 8.0),
        child: Stepper(
          //type de stepper
          type: StepperType.horizontal,
          //list de steps
          steps: getSteps(),
          //le step acctuel
          currentStep: currentStep,
          //action continuer
          onStepContinue: () {
            if (currentStep < 2) {
              setState(() => currentStep += 1);
            } else {
              // TODO send information
              print("task finish");
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
                const Divider(thickness: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: details.onStepCancel,
                        child: const Text("Retour",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: const Text("Suite"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (() =>
                            Navigator.pushNamed(context, '/login')),
                        child: const Text(
                          "Deja un compte ?",
                          style: TextStyle(fontSize: 14),
                        ))
                  ],
                ),
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
            content: Container(
              height: 200,
              width: 500,
              child: Text(emailReturn.text),
            )),
        Step(
            isActive: currentStep >= 2,
            state: currentStep <= 2 ? StepState.editing : StepState.complete,
            title: const Text(
              'Complete',
              style: mTextStepName,
            ),
            content: Container(
              height: 200,
              width: 500,
            )),
      ];
}
