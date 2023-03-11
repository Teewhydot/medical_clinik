import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/utils.dart';

import '../../../../generated/assets.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Image.asset(Assets.imagesDoctorImageIntro,
                    width: baseWidth, fit: BoxFit.fill),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 35 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 361 * fem,
                    ),
                    child: Text(
                      'Manage your health and happy future',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Gilroy-SemiBold',
                        fontSize: 28 * fem,
                        fontWeight: FontWeight.w400,
                        height: 1.3571428571,
                        color: kDarkGrey,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        105 * fem, 0 * fem, 105 * fem, 0 * fem),
                    width: double.infinity,
                    height: 50 * fem,
                    decoration: BoxDecoration(
                      color: const Color(0xff65c997),
                      borderRadius: BorderRadius.circular(18 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Get started',
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
                ],
              ),
            )
          ],
        ));
  }
}
