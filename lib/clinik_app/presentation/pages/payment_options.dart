import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/booking_success.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/doctor_details.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/button_widget.dart';
import 'package:medical_clinik/generated/assets.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  int? radioChoice, radioValue;
  @override
  Widget build(BuildContext context) {
    final fem = MediaQuery.of(context).size.width / baseWidth;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: kScaffoldColor,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kScaffoldColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const LeftAlignedText(text: 'Payment Methods'),
                  addVerticalSpacing(20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReusableContainer(
                        fem: fem,
                        width: double.infinity,
                        height: 74 * fem,
                        color: kDarkGreyShade400,
                        borderRadius: 10,
                        child: RadioListTile<int>(
                          groupValue: radioChoice,
                          value: radioValue = 1,
                          title: const Text('Paypal'),
                          secondary: Image.asset(
                            Assets.imagesIconPaypal,
                            height: 74 * fem,
                            width: 101 * fem,
                          ),
                          onChanged: (value) {
                            setState(() {
                              radioChoice = 1;
                            });
                          },
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReusableContainer(
                        fem: fem,
                        width: double.infinity,
                        height: 74 * fem,
                        color: kDarkGreyShade400,
                        borderRadius: 10,
                        child: RadioListTile<int>(
                          groupValue: radioChoice,
                          value: radioValue = 2,
                          title: const Text('Credit card'),
                          secondary: Image.asset(
                            Assets.iconsMcAndVisa,
                            height: 74 * fem,
                            width: 101 * fem,
                          ),
                          onChanged: (value) {
                            setState(() {
                              radioChoice = 2;
                            });
                          },
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  ButtonWidget(
                      fem: fem,
                      color: kAccentPrimaryGreen,
                      buttonText: "Proceed",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BookingSuccessPage()));
                      }),
                  addVerticalSpacing(40),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
