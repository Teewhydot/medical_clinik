import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/payment_options.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/date_select_widget.dart';
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
                image: widget.image,
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

class ReusableContainer extends StatelessWidget {
  const ReusableContainer(
      {super.key,
      required this.fem,
      required this.width,
      required this.height,
      required this.child,
      required this.color,
      required this.borderRadius});

  final double fem;
  final double height;
  final double width;
  final Widget child;
  final double borderRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * fem,
      width: width * fem,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius * fem),
      ),
      child: Center(child: child),
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

class DoctorStats extends StatelessWidget {
  const DoctorStats({
    super.key,
    required this.fem,
    required this.rating,
  });

  final double fem;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Patients',
              style: kSubHeaderTextStyleGrey,
            ),
            Text(
              'Experience',
              style: kSubHeaderTextStyleGrey,
            ),
            Text(
              'Ratings',
              style: kSubHeaderTextStyleGrey,
            )
          ],
        ),
        addVerticalSpacing(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ReusableContainer(
              fem: fem,
              height: 58 * fem,
              width: 117 * fem,
              color: kDarkGreyShade400,
              borderRadius: 10,
              child: Center(
                child: Text(
                  '+423',
                  style: kHeaderTextStyleBlack.copyWith(
                    fontSize: 18 * fem,
                  ),
                ),
              ),
            ),
            ReusableContainer(
              fem: fem,
              height: 58 * fem,
              width: 117 * fem,
              borderRadius: 10,
              color: kDarkGreyShade400,
              child: Center(
                child: Text(
                  '+8yrs',
                  style: kHeaderTextStyleBlack.copyWith(
                    fontSize: 18 * fem,
                  ),
                ),
              ),
            ),
            ReusableContainer(
              fem: fem,
              height: 58 * fem,
              width: 117 * fem,
              borderRadius: 10,
              color: kDarkGreyShade400,
              child: Center(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        rating,
                        style: kHeaderTextStyleBlack.copyWith(
                          fontSize: 18 * fem,
                        ),
                      ),
                      const Icon(Icons.star,
                          color: kAccentPrimaryPurple, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
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

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.fem,
    required this.color,
    required this.name,
    required this.profession,
    required this.image,
  });

  final double fem;
  final Color color;
  final String name;
  final String profession;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 0 * fem),
      height: 120 * fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 18 * fem, 0 * fem),
            padding: EdgeInsets.fromLTRB(0 * fem, 74 * fem, 0 * fem, 0 * fem),
            width: 100 * fem,
            height: 100 * fem,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  image,
                ),
              ),
            ),
            // child: Container(
            //   // Hbn (9:899)
            //   padding: EdgeInsets.fromLTRB(
            //       6 * fem, 5 * fem, 8 * fem, 4 * fem),
            //   width: 51 * fem,
            //   height: 26,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.only(
            //       topRight: Radius.circular(6 * fem),
            //     ),
            //   ),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Container(
            //         margin: EdgeInsets.fromLTRB(
            //             0 * fem, 0 * fem, 3.58 * fem, 0.1 * fem),
            //         width: 11.42 * fem,
            //         height: 10.9 * fem,
            //         child: Image.asset(
            //           Assets.imagesIconStar,
            //           width: 11.42 * fem,
            //           height: 10.9 * fem,
            //         ),
            //       ),
            //       Text(
            //         // FS8 (9:901)
            //         '4.8',
            //         style: kSubHeaderTextStyleGrey,
            //       ),
            //     ],
            //   ),
            // ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 64 * fem, 0 * fem),
            width: 154 * fem,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 2 * fem),
                  child: Text(
                    name,
                    style: kHeaderTextStyleBlack.copyWith(
                      fontSize: 18 * fem,
                    ),
                  ),
                ),
                addVerticalSpacing(10),
                Text(profession,
                    style: kSubHeaderTextStyleGrey.copyWith(
                      fontSize: 14 * fem,
                    )),
                addVerticalSpacing(10),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 30 * fem, 0 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 14 * fem, 0 * fem),
                        width: 40 * fem,
                        height: 40 * fem,
                        child: Image.asset(
                          Assets.iconsChat,
                          width: 40 * fem,
                          height: 40 * fem,
                        ),
                      ),
                      SizedBox(
                        width: 40 * fem,
                        height: 40 * fem,
                        child: Image.asset(
                          Assets.iconsCall,
                          width: 40 * fem,
                          height: 40 * fem,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 9 * fem, 0 * fem, 3 * fem),
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 54 * fem),
                  width: 26 * fem,
                  height: 6 * fem,
                  child: Image.asset(
                    Assets.imagesIconEllipses,
                    width: 26 * fem,
                    height: 6 * fem,
                  ),
                ),
                Text(
                  '\$80',
                  style: kSubHeaderTextStyleGrey.copyWith(
                      fontSize: 28 * fem, color: kDarkGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    required this.fem,
    required this.color,
  });

  final double fem;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // rectangleRoN (9:882)
      margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 8 * fem, 0 * fem),
      width: 8 * fem,
      height: 8 * fem,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6 * fem),
        color: color,
      ),
    );
  }
}
