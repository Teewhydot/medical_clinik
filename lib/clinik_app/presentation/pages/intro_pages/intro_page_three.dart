import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/generated/assets.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 90 * fem),
                child: Image.asset(
                  Assets.imagesLogoMedicine143,
                  height: 33 * fem,
                  width: 33 * fem,
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 13 * fem),
              child: Text(
                'A little about yourself',
                textAlign: TextAlign.center,
                style: kHeaderTextStyle,
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 72 * fem),
              constraints: BoxConstraints(
                maxWidth: 316 * fem,
              ),
              child: Text(
                'Pellentesque placerat arcu in risus facilisis, sed laoreet eros laoreet.',
                textAlign: TextAlign.center,
                style: kSubHeaderTextStyle,
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 250 * fem, 13 * fem),
              child: Text(
                'Your gender',
                style: kHeaderTextStyle,
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 42 * fem),
              width: double.infinity,
              height: 99 * fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      // maleKF6 (9:443)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 10 * fem, 0 * fem),
                      padding: EdgeInsets.fromLTRB(
                          12 * fem, 18 * fem, 25 * fem, 18 * fem),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffeff2f1),
                        borderRadius: BorderRadius.circular(18 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 63 * fem,
                            height: 63 * fem,
                            decoration: BoxDecoration(
                              color: kAccentPrimaryGreen,
                              borderRadius: BorderRadius.circular(13 * fem),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 15.93 * fem,
                                height: 28 * fem,
                                child: Image.asset(
                                  Assets.imagesIconMale,
                                  width: 15.93 * fem,
                                  height: 28 * fem,
                                ),
                              ),
                            ),
                          ),
                          addHorizontalSpacing(10 * fem),
                          Text(
                            // maleBwW (9:445)
                            'Male',
                            style: kHeaderTextStyle.copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // maleKF6 (9:443)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 10 * fem, 0 * fem),
                      padding: EdgeInsets.fromLTRB(
                          12 * fem, 18 * fem, 25 * fem, 18 * fem),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffeff2f1),
                        borderRadius: BorderRadius.circular(18 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 63 * fem,
                            height: 63 * fem,
                            decoration: BoxDecoration(
                              color: kDarkGreyShade200,
                              borderRadius: BorderRadius.circular(13 * fem),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 15.93 * fem,
                                height: 28 * fem,
                                child: Image.asset(
                                  Assets.imagesIconFemale,
                                  width: 15.93 * fem,
                                  height: 28 * fem,
                                ),
                              ),
                            ),
                          ),
                          addHorizontalSpacing(10 * fem),
                          Text(
                            // maleBwW (9:445)
                            'Female',
                            style: kHeaderTextStyle.copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 240 * fem, 13 * fem),
              child: Text(
                'Your birthday',
                style: kHeaderTextStyle,
              ),
            ),
            Container(
              // birthdayWkp (9:421)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 92.5 * fem, 38 * fem),
              height: 85 * fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 79 * fem,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // dayCNk (9:423)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 7 * fem),
                          child: Text(
                            'Day:',
                            style: kSubHeaderTextStyle,
                          ),
                        ),
                        TextFormField(
                          maxLength: 2,
                          // day (9:424)
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding: EdgeInsets.fromLTRB(
                                5 * fem, 4 * fem, 5 * fem, 3 * fem),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10 * fem),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  addHorizontalSpacing(16),
                  SizedBox(
                    width: 79 * fem,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // mounthJKJ (9:427)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 7 * fem),
                          child: Text('Mounth:', style: kSubHeaderTextStyle),
                        ),
                        TextFormField(
                          maxLength: 2,
                          // day (9:424)
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding: EdgeInsets.fromLTRB(
                                5 * fem, 4 * fem, 5 * fem, 3 * fem),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10 * fem),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  addHorizontalSpacing(16),
                  SizedBox(
                    width: 79 * fem,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // year2uW (9:431)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 7 * fem),
                          child: Text(
                            'Year:',
                            style: kSubHeaderTextStyle,
                          ),
                        ),
                        TextFormField(
                          maxLength: 4,
                          // day (9:424)
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding: EdgeInsets.fromLTRB(
                                5 * fem, 4 * fem, 5 * fem, 3 * fem),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10 * fem),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
