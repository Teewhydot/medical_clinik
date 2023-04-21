import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer(
      {super.key,
      required this.fem,
      required this.width,
      required this.height,
      required this.child,
      required this.color,
      required this.borderRadius});

  final double fem;
  final double height;
  final double width;
  final Widget child;
  final double borderRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * fem,
      width: width * fem,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius * fem),
      ),
      child: Center(child: child),
    );
  }
}
