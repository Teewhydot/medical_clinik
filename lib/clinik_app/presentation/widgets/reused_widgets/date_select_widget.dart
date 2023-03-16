import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/doctor_details.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';

class SelectDateWidget extends StatefulWidget {
  const SelectDateWidget({super.key});

  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends State<SelectDateWidget> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / baseWidth;
    final List<int> dates = List.generate(31, (index) => index + 1);
    return SizedBox(
      height: 79 * fem,
      child: ListView.builder(
        itemCount: dates.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final bool isSelected = index == selectedIndex;
          final Color color = isSelected ? Colors.green : kDarkGreyShade400;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 5),
              child: ReusableContainer(
                fem: fem,
                width: 75,
                height: 75,
                borderRadius: 10,
                color: color,
                child: Text('March ${dates[index]}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
