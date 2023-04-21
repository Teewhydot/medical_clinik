import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    required this.fem,
    required this.color,
  });

  final double fem;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // rectangleRoN (9:882)
      margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 8 * fem, 0 * fem),
      width: 8 * fem,
      height: 8 * fem,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6 * fem),
        color: color,
      ),
    );
  }
}
