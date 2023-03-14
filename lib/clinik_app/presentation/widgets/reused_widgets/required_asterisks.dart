import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';

class RequiredAsterisks extends StatelessWidget {
  const RequiredAsterisks({
    super.key,
    required this.fem,
  });

  final double fem;

  @override
  Widget build(BuildContext context) {
    return Container(
      // xek (9:556)
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 80 * fem, 0 * fem),
      child: Text(
        '*',
        style: kSubHeaderTextStyleGrey.copyWith(color: Colors.red),
      ),
    );
  }
}
