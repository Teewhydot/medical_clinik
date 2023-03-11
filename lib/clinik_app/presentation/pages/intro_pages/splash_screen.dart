import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/generated/assets.dart';
import 'package:medical_clinik/utils.dart';

class MedicalClinik extends StatelessWidget {
  const MedicalClinik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Image.asset(
                Assets.imagesLogo,
                height: 121 * fem,
                width: 180 * fem,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Loading...',
              style: SafeGoogleFont(
                'Gilroy-SemiBold',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.2575,
                color: const Color(0xffcdcfce),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
