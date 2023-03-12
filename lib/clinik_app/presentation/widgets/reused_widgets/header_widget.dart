import 'package:flutter/material.dart';
import 'package:medical_clinik/generated/assets.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.fem,
    required this.headerText,
    required this.subHeaderText,
  });

  final double fem;
  final Widget headerText;
  final Widget subHeaderText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 50 * fem),
            child: Image.asset(
              Assets.imagesLogoMedicine143,
              height: 33 * fem,
              width: 33 * fem,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 13 * fem),
          child: headerText,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 10 * fem),
          constraints: BoxConstraints(
            maxWidth: 316 * fem,
          ),
          child: subHeaderText,
        ),
      ],
    );
  }
}
