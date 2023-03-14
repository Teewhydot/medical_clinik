import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/button_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/checkbox_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/custom_textfield.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/header_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/required_asterisks.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                HeaderWidget(
                  fem: fem,
                  headerText: Text(
                    'Sign Up',
                    style: kHeaderTextStyleBlack,
                    textAlign: TextAlign.center,
                  ),
                  subHeaderText: Container(),
                ),
                Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Full Name', style: kSubHeaderTextStyleGrey)),
                    RequiredAsterisks(fem: fem),
                  ],
                ),
                addVerticalSpacing(10),
                const CustomTextField(
                  keyboardType: TextInputType.name,
                  hintText: 'John Wick',
                ),
                addVerticalSpacing(10),
                Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Email', style: kSubHeaderTextStyleGrey)),
                    RequiredAsterisks(fem: fem),
                  ],
                ),
                addVerticalSpacing(10),
                const CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'patient@self.com',
                ),
                addVerticalSpacing(10),
                Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Password', style: kSubHeaderTextStyleGrey)),
                    RequiredAsterisks(fem: fem),
                  ],
                ),
                addVerticalSpacing(10),
                const CustomTextField(
                  keyboardType: TextInputType.visiblePassword,
                  hintText: 'Min 8 characters',
                ),
                addVerticalSpacing(10),
                // checkbox and text
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: MyCheckbox(),
                    ),
                    Expanded(
                      flex: 7,
                      child: RichText(
                        text: TextSpan(
                          style: kSubHeaderTextStyleGrey,
                          children: [
                            const TextSpan(
                              text: 'I agree with the terms and ',
                            ),
                            TextSpan(
                                text: 'Privacy policy',
                                style: kSubHeaderTextStyleGrey.copyWith(
                                    color: kAccentPrimaryGreen)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            addVerticalSpacing(50),
            Column(
              children: [
                ButtonWidget(
                  fem: fem,
                  color: kAccentPrimaryGreen,
                  buttonText: 'Sign Up',
                  onTap: () {},
                ),
                addVerticalSpacing(15),
                RichText(
                  text: TextSpan(
                    style: kSubHeaderTextStyleGrey,
                    children: [
                      const TextSpan(
                        text: 'Already have an account? ',
                      ),
                      TextSpan(
                          text: 'Sign In',
                          style: kSubHeaderTextStyleGrey.copyWith(
                              color: kAccentPrimaryGreen)),
                    ],
                  ),
                ),
                addVerticalSpacing(20)
              ],
            )
          ]),
        ),
      )),
    );
  }
}
