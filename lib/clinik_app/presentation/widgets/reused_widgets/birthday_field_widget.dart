import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';

class BirthdayFieldWidget extends StatelessWidget {
  const BirthdayFieldWidget({
    super.key,
    required this.fem,
    required this.width,
    required this.label,
    required this.maxLength,
  });

  final double fem;
  final double width;
  final String label;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * fem,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // dayCNk (9:423)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 7 * fem),
            child: Text(
              label,
              style: kSubHeaderTextStyle,
            ),
          ),
          TextFormField(
            maxLength: maxLength,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counterText: '',
              contentPadding:
                  EdgeInsets.fromLTRB(5 * fem, 4 * fem, 5 * fem, 3 * fem),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10 * fem),
              ),
            ),
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
          ),
        ],
      ),
    );
  }
}
