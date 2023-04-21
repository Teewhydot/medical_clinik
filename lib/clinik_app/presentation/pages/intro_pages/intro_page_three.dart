import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/auth_pages/sign_in.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/device_width.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/birthday_field_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/button_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/country_drop_down.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/header_widget.dart';
import 'package:medical_clinik/generated/assets.dart';

class IntroPageThree extends StatefulWidget {
  const IntroPageThree({Key? key}) : super(key: key);

  @override
  State<IntroPageThree> createState() => _IntroPageThreeState();
}

class _IntroPageThreeState extends State<IntroPageThree> {
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double fem = Constants.deviceWidth! / baseWidth;
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
                    style: kHeaderTextStyleBlack, textAlign: TextAlign.center),
                subHeaderText: Text(
                    'Pellentesque placerat arcu in risus facilisis, sed laoreet eros laoreet',
                    style: kSubHeaderTextStyleGrey,
                    textAlign: TextAlign.center),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your gender',
                  style: kHeaderTextStyleBlack,
                ),
              ),
              addVerticalSpacing(20),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0.5 * fem, 0 * fem, 0 * fem, 42 * fem),
                width: double.infinity,
                height: 99 * fem,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 10 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            12 * fem, 18 * fem, 25 * fem, 18 * fem),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: selectedIndex == 1
                              ? kAccentPrimaryGreen.withOpacity(0.5)
                              : kDarkGreyShade400,
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
                              style:
                                  kHeaderTextStyleBlack.copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      child: Container(
                        // maleKF6 (9:443)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 10 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            12 * fem, 18 * fem, 25 * fem, 18 * fem),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: selectedIndex == 2
                              ? kAccentPrimaryGreen.withOpacity(0.5)
                              : kDarkGreyShade400,
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
                              style:
                                  kHeaderTextStyleBlack.copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your gender',
                  style: kHeaderTextStyleBlack.copyWith(fontSize: 18),
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
                      controller: _dayController,
                    ),
                    addHorizontalSpacing(16),
                    BirthdayFieldWidget(
                      fem: fem,
                      width: 79,
                      label: 'Month',
                      maxLength: 2,
                      controller: _monthController,
                    ),
                    addHorizontalSpacing(16),
                    BirthdayFieldWidget(
                      fem: fem,
                      width: 99,
                      label: 'Year',
                      maxLength: 4,
                      controller: _yearController,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your location',
                  style: kHeaderTextStyleBlack.copyWith(fontSize: 18),
                ),
              ),
              addVerticalSpacing(10),
              const CountryPickerWidget(),
              addVerticalSpacing(60),
              ButtonWidget(
                fem: fem,
                color: kAccentPrimaryGreen,
                buttonText: 'Continue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
