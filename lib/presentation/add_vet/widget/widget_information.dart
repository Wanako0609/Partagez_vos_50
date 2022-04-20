import 'package:flutter/material.dart';

class AddVetDescription extends StatelessWidget {
  const AddVetDescription({required this.label, required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
    );
  }
}
