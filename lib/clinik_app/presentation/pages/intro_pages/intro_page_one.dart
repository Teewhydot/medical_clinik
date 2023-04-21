import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/intro_pages/intro_page_two.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/device_width.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/button_widget.dart';

import '../../../../generated/assets.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = Constants.deviceWidth! / baseWidth;
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
                      style: kHeaderTextStyleBlack,
                    ),
                  ),
                  ButtonWidget(
                    fem: fem,
                    color: kAccentPrimaryGreen,
                    buttonText: 'Get Started',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IntroPageTwo(),
                          // initScreen == 0 || initScreen == null
                          //     ? const IntroPageTwo()
                          //     : const SignInPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
