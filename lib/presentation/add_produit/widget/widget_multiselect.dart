import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class SelectInformation extends StatefulWidget {
  SelectInformation(
      {required this.list, required this.whenEmpty, required this.listReturn});

  final String whenEmpty;
  final List<String> list;
  List<String> listReturn;

  @override
  State<SelectInformation> createState() => _SelectInformationState();
}

class _SelectInformationState extends State<SelectInformation> {
  @override
  Widget build(BuildContext context) {
    return DropDownMultiSelect(
      onChanged: (List<String> x) {
        setState(() {
          widget.listReturn = x;
        });
      },
      options: widget.list,
      selectedValues: widget.listReturn,
      whenEmpty: "",
      decoration: InputDecoration(label: Text(widget.whenEmpty)),
    );
  }
}
