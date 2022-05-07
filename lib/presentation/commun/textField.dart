import 'package:flutter/material.dart';
import 'package:partagez_vos_50/presentation/commun/constants.dart';

Column mTextField(
    {required String title,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
    String? errorText,
    bool obsucureText = false}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 17, color: mTextColor))
        ],
      ),
      const SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(errorText: errorText),
        controller: controller,
        keyboardType: inputType,
        obscureText: obsucureText,
      ),
    ],
  );
}
