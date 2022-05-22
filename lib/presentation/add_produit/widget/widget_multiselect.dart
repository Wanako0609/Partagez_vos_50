import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

// ignore: must_be_immutable
class SelectInformation extends StatefulWidget {
  SelectInformation(
      {Key? key,
      required this.list,
      required this.whenEmpty,
      required this.listReturn})
      : super(key: key);

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
