import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/button_widget.dart';
import 'package:medical_clinik/generated/assets.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                  'Let\'s get acquainted',
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
                    EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 18 * fem),
                padding:
                    EdgeInsets.fromLTRB(18 * fem, 18 * fem, 15 * fem, 8 * fem),
                width: double.infinity,
                height: 119 * fem,
                decoration: BoxDecoration(
                  color: const Color(0xfff4f6f5),
                  borderRadius: BorderRadius.circular(18 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 63 * fem,
                      width: 63 * fem,
                      decoration: BoxDecoration(
                        color: kAccentPrimaryGreen,
                        borderRadius: BorderRadius.circular(13 * fem),
                      ),
                      child: Center(
                        child: Image.asset(
                          Assets.imagesIconPatient,
                          width: 26.7 * fem,
                          height: 33 * fem,
                        ),
                      ),
                    ),
                    addHorizontalSpacing(20),
                    SizedBox(
                      width: 200 * fem,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'I’m a patient',
                              textAlign: TextAlign.left,
                              style: kHeaderTextStyle.copyWith(
                                  color: kAccentPrimaryGreen),
                            ),
                          ),
                          Text(
                            'Proin convallis libero ac nisl ',
                            style: kSubHeaderTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 18 * fem),
                padding:
                    EdgeInsets.fromLTRB(18 * fem, 18 * fem, 15 * fem, 8 * fem),
                width: double.infinity,
                height: 119 * fem,
                decoration: BoxDecoration(
                  color: const Color(0xfff4f6f5),
                  borderRadius: BorderRadius.circular(18 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 63 * fem,
                      width: 63 * fem,
                      decoration: BoxDecoration(
                        color: kDarkGreyShade400,
                        borderRadius: BorderRadius.circular(13 * fem),
                      ),
                      child: Center(
                        child: Image.asset(
                          Assets.imagesIconDoctor,
                          width: 26.7 * fem,
                          height: 33 * fem,
                        ),
                      ),
                    ),
                    addHorizontalSpacing(20),
                    SizedBox(
                      width: 200 * fem,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'I’m a Doctor',
                              textAlign: TextAlign.left,
                              style:
                                  kHeaderTextStyle.copyWith(color: kDarkGrey),
                            ),
                          ),
                          Text(
                            'Proin convallis libero ac nisl ',
                            style: kSubHeaderTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              ButtonWidget(
                  fem: fem, color: kAccentPrimaryGreen, buttonText: 'Continue'),
              addVerticalSpacing(30)
            ],
          ),
        ],
      ),
    ));
  }
}
