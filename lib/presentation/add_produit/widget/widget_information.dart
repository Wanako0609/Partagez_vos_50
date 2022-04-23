import 'package:flutter/material.dart';

class AddVetDescription extends StatelessWidget {
  const AddVetDescription(
      {required this.label, required this.controller, this.number});

  final String label;
  final TextEditingController controller;
  final TextInputType? number;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
      keyboardType: number,
    );
  }
}
