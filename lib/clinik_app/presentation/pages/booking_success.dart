import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/doctor_details.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/button_widget.dart';
import 'package:medical_clinik/generated/assets.dart';

class BookingSuccessPage extends StatelessWidget {
  const BookingSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: kAccentPrimaryGreen,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 346 * fem,
                  width: 414 * fem,
                  decoration: BoxDecoration(
                    color: kAccentPrimaryGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30 * fem),
                      bottomRight: Radius.circular(30 * fem),
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.iconsSelfcareLogo,
                        height: 32 * fem,
                        width: 121 * fem,
                      ),
                      addVerticalSpacing(50),
                      Image.asset(
                        Assets.iconsThankYou,
                        height: 192 * fem,
                        width: 362 * fem,
                      ),
                    ],
                  ),
                ),
                addVerticalSpacing(20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 74,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kScaffoldColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.imagesImageDrEleanorPena,
                                        width: 36,
                                        height: 36,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Dr Elena',
                                            ),
                                            Text(
                                              'Mad Scientist',
                                              style: kSubHeaderTextStyleGrey,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      addHorizontalSpacing(20),
                                      const Text(
                                        "(121 reviews)",
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: kAccentPrimaryPurple,
                                      ),
                                      const Text(
                                        '4.9',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      addVerticalSpacing(29),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const LeftAlignedText(text: 'Date:'),
                                  addVerticalSpacing(10),
                                  Text(
                                    '26, March 2023',
                                    style: kSubHeaderTextStyleGrey,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const LeftAlignedText(text: 'Time:'),
                                      addVerticalSpacing(10),
                                      Text(
                                        '16:11',
                                        style: kSubHeaderTextStyleGrey,
                                      ),
                                    ],
                                  ),
                                  addHorizontalSpacing(30),
                                ],
                              )
                            ],
                          ),
                          addVerticalSpacing(19),
                          const LeftAlignedText(text: "Location"),
                          addVerticalSpacing(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Assets.imagesIconLocation,
                                    width: 24,
                                    height: 24,
                                  ),
                                  addHorizontalSpacing(10),
                                  SizedBox(
                                    width: 147,
                                    child: Text(
                                      '''3891 Ranchview Dr. Richardson, San Francisco 62639''',
                                      style: kSubHeaderTextStyleGrey,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Assets.imagesIconHospital,
                                    width: 24,
                                    height: 24,
                                  ),
                                  addHorizontalSpacing(10),
                                  SizedBox(
                                    width: 147,
                                    child: Text(
                                      '''Jane Cooper Medical College''',
                                      style: kSubHeaderTextStyleGrey,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          addVerticalSpacing(20),
                        ],
                      ),
                      const LeftAlignedText(text: 'Cost: \$ 100'),
                      addVerticalSpacing(20),
                    ],
                  ),
                ),
                ButtonWidget(
                    fem: fem,
                    color: kAccentPrimaryGreen,
                    buttonText: 'Make Payment',
                    onTap: () {}),
                addVerticalSpacing(10),
                ReusableContainer(
                    fem: fem,
                    width: 200,
                    height: 50,
                    borderRadius: 15,
                    color: kScaffoldColor,
                    child: Text(
                      'Cancel Reservation',
                      style: kSubHeaderTextStyleGrey,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
