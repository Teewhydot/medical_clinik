import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/auth_pages/sign_up.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/mainscreen.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/button_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/custom_textfield.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/header_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  HeaderWidget(
                    fem: fem,
                    headerText: Text(
                      'Sign in',
                      style: kHeaderTextStyleBlack,
                      textAlign: TextAlign.center,
                    ),
                    subHeaderText: Container(),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Email', style: kSubHeaderTextStyleGrey)),
                  addVerticalSpacing(10),
                  const CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'patient@self.com',
                  ),
                  addVerticalSpacing(10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Password', style: kSubHeaderTextStyleGrey)),
                  addVerticalSpacing(10),
                  const CustomTextField(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Min 8 characters',
                  ),
                  addVerticalSpacing(10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot your password?',
                        style: kSubHeaderTextStyleGrey.copyWith(
                            color: kAccentPrimaryGreen)),
                  ),
                ],
              ),
              Column(
                children: [
                  ButtonWidget(
                    fem: fem,
                    color: kAccentPrimaryGreen,
                    buttonText: 'Sign In',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()),
                      );
                    },
                  ),
                  addVerticalSpacing(15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        style: kSubHeaderTextStyleGrey,
                        children: [
                          const TextSpan(
                            text: 'Don’t have an account? ',
                          ),
                          TextSpan(
                              text: 'Sign Up',
                              style: kSubHeaderTextStyleGrey.copyWith(
                                  color: kAccentPrimaryGreen)),
                        ],
                      ),
                    ),
                  ),
                  addVerticalSpacing(20)
                ],
              )
            ]),
      )),
    );
  }
}
