import 'package:flutter/material.dart';

class VerifyPage extends StatefulWidget {
  final String email;

  VerifyPage({required this.email});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Email : ${widget.email}"),
        ],
      ),
    );
  }
}
