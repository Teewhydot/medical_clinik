import 'package:flutter/material.dart';
import 'package:medical_clinik/utils.dart';

Widget addVerticalSpacing(double height) => SizedBox(height: height);
Widget addHorizontalSpacing(double width) => SizedBox(width: width);
double baseWidth = 414;
const Color kLoadingColor = Color(0xffcdcfce);
const Color kDarkGrey = Color(0xff1C1F1E);
const Color kDarkGreyShade800 = Color(0xffA7A6A5);
const Color kDarkGreyShade600 = Color(0xffCDCFCE);
const Color kDarkGreyShade400 = Color(0xffEFF2F1);
const Color kDarkGreyShade200 = Color(0xffF4F6F5);
const Color kAccentPrimaryGreen = Color(0xff66CA98);
const Color kAccentPrimaryBlue = Color(0xff6295E2);
const Color kAccentPrimaryRed = Color(0xffFF6C52);
const Color kAccentPrimaryPurple = Color(0xffF4A3EC);
const Color kScaffoldColor = Color(0xffF5F5F5);
TextStyle kHeaderTextStyleBlack = SafeGoogleFont(
  'Gilroy-SemiBold',
  fontSize: 28,
  fontWeight: FontWeight.w600,
  height: 1.3571428571,
  color: kDarkGrey,
);
TextStyle kHeaderTextStyleWhite = SafeGoogleFont(
  'Gilroy-SemiBold',
  fontSize: 28,
  fontWeight: FontWeight.w600,
  height: 1.3571428571,
  color: Colors.white,
);

TextStyle kSubHeaderTextStyleGrey = SafeGoogleFont(
  'Inter',
  fontSize: 14,
  fontWeight: FontWeight.w500,
  height: 1.2125,
  color: kDarkGreyShade800,
);
