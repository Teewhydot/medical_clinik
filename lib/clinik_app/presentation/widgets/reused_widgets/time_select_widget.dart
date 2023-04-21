import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/reusable_container.dart';

class TimeSelectWidget extends StatefulWidget {
  const TimeSelectWidget({super.key});

  @override
  TimeSelectWidgetState createState() => TimeSelectWidgetState();
}

class TimeSelectWidgetState extends State<TimeSelectWidget> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Wrap(
      alignment: WrapAlignment.start,
      runSpacing: 10,
      spacing: 20 * fem,
      direction: Axis.horizontal,
      children: List.generate(
        7,
        (index) {
          final bool isSelected = index == selectedIndex;
          final Color color = isSelected ? Colors.green : kDarkGreyShade400;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: ReusableContainer(
              fem: fem,
              width: 83 * fem,
              height: 42 * fem,
              borderRadius: 10,
              color: color,
              child: Text(
                '12:00',
                style: kHeaderTextStyleBlack.copyWith(fontSize: 14 * fem),
              ),
            ),
          );
        },
      ),
    );
  }
}
