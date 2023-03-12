import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/birthday_field_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/button_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/country_drop_down.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/header_widget.dart';
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
              HeaderWidget(
                fem: fem,
                headerText: Text('A little about yourself',
                    style: kHeaderTextStyle, textAlign: TextAlign.center),
                subHeaderText: Text(
                    'Pellentesque placerat arcu in risus facilisis, sed laoreet eros laoreet',
                    style: kSubHeaderTextStyle,
                    textAlign: TextAlign.center),
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
                          addHorizontalSpacing(20 * fem),
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
                  style: kHeaderTextStyle.copyWith(fontSize: 18),
                ),
              ),
              addVerticalSpacing(10),
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
                      maxLength: 2,
                    ),
                    addHorizontalSpacing(16),
                    BirthdayFieldWidget(
                      fem: fem,
                      width: 79,
                      label: 'Month',
                      maxLength: 2,
                    ),
                    addHorizontalSpacing(16),
                    BirthdayFieldWidget(
                      fem: fem,
                      width: 99,
                      label: 'Year',
                      maxLength: 4,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your location',
                  style: kHeaderTextStyle.copyWith(fontSize: 18),
                ),
              ),
              addVerticalSpacing(10),
              const CountryPickerWidget(),
              addVerticalSpacing(60),
              ButtonWidget(
                  fem: fem, color: kAccentPrimaryGreen, buttonText: 'Continue')
            ],
          ),
        ),
      ),
    ));
  }
}
