import 'package:flutter/material.dart';
import '../widget/stats/numberAdmin.dart';
import '../widget/stats/number_user.dart';

class StatsAdmin extends StatelessWidget {
  const StatsAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double coter = 170;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(
                  child: UserNumber(),
                  height: coter,
                  width: coter,
                ),
                SizedBox(
                  child: AdminUserNumber(),
                  height: coter,
                  width: coter,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
