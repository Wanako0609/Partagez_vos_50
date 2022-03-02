import 'package:flutter/material.dart';

//firebase link
class TopClothe extends StatelessWidget {
  TopClothe({this.height = 150});

  double height;
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'A',
    'B',
    'C',
    'A',
    'B',
    'C',
    'A',
    'B',
    'C',
  ];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        //padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Container(
              width: 150,
              color: Colors.amber,
              child: Center(child: Text('Entry ${entries[index]}')),
            ),
          );
        },
      ),
    );
  }
}
