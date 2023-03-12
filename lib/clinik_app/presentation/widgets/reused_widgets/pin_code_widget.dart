import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatefulWidget {
  const PinCodeWidget({Key? key}) : super(key: key);

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 79,
        fieldWidth: 79,
        activeFillColor: Colors.white,
        inactiveColor: kDarkGreyShade400,
        inactiveFillColor: kDarkGreyShade400,
        selectedColor: kDarkGreyShade600,
        selectedFillColor: kDarkGreyShade400,
      ),
      enableActiveFill: true,
      autoDismissKeyboard: true,
      useHapticFeedback: true,
      showCursor: false,
      autoFocus: true,
      focusNode: FocusNode(),
      autoDisposeControllers: true,
      enablePinAutofill: true,
      keyboardType: TextInputType.number,
      animationDuration: const Duration(milliseconds: 300),
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {
        print(value);
        setState(() {});
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      appContext: context,
    );
  }
}
