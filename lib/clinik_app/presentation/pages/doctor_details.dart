import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/payment_options.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/date_select_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/doctor_card.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/doctor_stats.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/dot_widget.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/reusable_container.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/time_select_widget.dart';
import 'package:medical_clinik/generated/assets.dart';

class DoctorsDetailsPage extends StatefulWidget {
  const DoctorsDetailsPage({
    Key? key,
    required this.image,
    required this.name,
    required this.profession,
    required this.hasAppointment,
    required this.rating,
  }) : super(key: key);

  final String image;
  final String name;
  final String profession;
  final bool hasAppointment;
  final String rating;

  @override
  State<DoctorsDetailsPage> createState() => _DoctorsDetailsPageState();
}

class _DoctorsDetailsPageState extends State<DoctorsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SingleChildScrollView(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addHorizontalSpacing(10),
                      const Icon(
                        Icons.arrow_back_ios,
                        color: kDarkGrey,
                      ),
                    ],
                  ),
                ),
              ),
              DoctorCard(
                fem: fem,
                color: Colors.white,
                name: widget.name,
                profession: widget.profession,
                imagePath: widget.image,
              ),
              Visibility(
                visible: widget.hasAppointment,
                child: AppointmentWidget(
                  fem: fem,
                  text: 'Cancel appointment',
                  color: kDarkGrey,
                ),
              ),
              addVerticalSpacing(20),
              DoctorStats(
                fem: fem,
                rating: widget.rating,
              ),
              addVerticalSpacing(30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Visibility(
                      visible: !widget.hasAppointment,
                      child: Column(
                        children: [
                          const LeftAlignedText(
                            text: 'Schedule',
                          ),
                          const SelectDateWidget(),
                          addVerticalSpacing(30),
                          const LeftAlignedText(
                            text: 'Time',
                          ),
                          const TimeSelectWidget(),
                        ],
                      ),
                    ),
                    addVerticalSpacing(30),
                    Visibility(
                      visible: !widget.hasAppointment,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PaymentOptions()));
                        },
                        child: AppointmentWidget(
                          fem: fem,
                          text: 'Make payment',
                          color: kAccentPrimaryGreen,
                        ),
                      ),
                    ),
                    addVerticalSpacing(20),
                    const LeftAlignedText(
                      text: 'About the doctor',
                    ),
                    addVerticalSpacing(10),
                    ReusableContainer(
                      fem: fem,
                      width: 375,
                      height: 150,
                      borderRadius: 10,
                      color: kScaffoldColor,
                      child: Text(
                        '${widget.name} is a board certified ${widget.profession} with over 10 years of experience in the field of medicine. He is a graduate of the University of California, San Francisco, School of Medicine. He completed his residency in Internal Medicine at the University of California, San Francisco, Medical Center. He is a member of the American College of Physicians and the American Medical Association.',
                        style: kSubHeaderTextStyleGrey.copyWith(
                            fontSize: 14 * fem),
                      ),
                    ),
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
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class LeftAlignedText extends StatelessWidget {
  const LeftAlignedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: kHeaderTextStyleBlack,
      ),
    );
  }
}

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({
    super.key,
    required this.fem,
    required this.color,
    required this.text,
  });

  final double fem;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(18 * fem, 18 * fem, 18 * fem, 17 * fem),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10 * fem),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                DotWidget(
                  fem: fem,
                  color: Colors.white,
                ),
                Text(
                  text,
                  style: kHeaderTextStyleWhite,
                ),
              ],
            ),
            Image.asset(
              Assets.iconsTwoForwardArrows,
              width: 20,
              height: 14,
            )
          ],
        ),
      ),
    );
  }
}
