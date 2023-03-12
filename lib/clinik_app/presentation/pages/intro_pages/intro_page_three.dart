import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your gender',
                  style: kHeaderTextStyle,
                ),
              ),
              addVerticalSpacing(20),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 42 * fem),
                width: double.infinity,
                height: 99 * fem,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
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
                    Container(
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
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your gender',
                  style: kHeaderTextStyle,
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 38 * fem),
                height: 100 * fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BirthdayFieldWidget(
                      fem: fem,
                      width: 70,
                      label: 'Day',
                    ),
                    addHorizontalSpacing(16),
                    BirthdayFieldWidget(
                      fem: fem,
                      width: 79,
                      label: 'Month',
                    ),
                    addHorizontalSpacing(16),
                    BirthdayFieldWidget(
                      fem: fem,
                      width: 99,
                      label: 'Year',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class BirthdayFieldWidget extends StatelessWidget {
  const BirthdayFieldWidget({
    super.key,
    required this.fem,
    required this.width,
    required this.label,
  });

  final double fem;
  final double width;
  final String label;

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
            maxLength: 2,
            // day (9:424)
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
