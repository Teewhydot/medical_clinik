import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/button_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/header_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/pin_code_widget.dart';

class EmailPinPage extends StatelessWidget {
  const EmailPinPage({Key? key}) : super(key: key);

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
              HeaderWidget(
                  fem: fem,
                  headerText: Text(
                    'Enter Code',
                    style: kHeaderTextStyle,
                  ),
                  subHeaderText: Text(
                    'Code sent to email',
                    style: kSubHeaderTextStyle,
                  )),
              const PinCodeWidget(),
              RichText(
                text: TextSpan(
                  style: kSubHeaderTextStyle,
                  children: [
                    const TextSpan(
                      text: 'Need a new code? ',
                    ),
                    TextSpan(
                        text: 'Resend Code',
                        style: kSubHeaderTextStyle.copyWith(
                            color: kAccentPrimaryGreen)),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              ButtonWidget(
                fem: fem,
                color: kAccentPrimaryGreen,
                buttonText: 'Verify',
                onTap: () {},
              ),
              addVerticalSpacing(20)
            ],
          ),
        ],
      )),
    );
  }
}
