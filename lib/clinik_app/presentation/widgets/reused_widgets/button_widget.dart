import 'package:flutter/material.dart';
import 'package:medical_clinik/utils.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.fem,
    required this.color,
    required this.buttonText,
    required this.onTap,
  });

  final double fem;
  final Color color;
  final String buttonText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(105 * fem, 0 * fem, 105 * fem, 0 * fem),
        width: double.infinity,
        height: 50 * fem,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18 * fem),
        ),
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: SafeGoogleFont(
              'Gilroy-SemiBold',
              fontSize: 16 * fem,
              fontWeight: FontWeight.w400,
              height: 1.2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
