import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/generated/assets.dart';

class DoctorsDetailsPage extends StatefulWidget {
  const DoctorsDetailsPage({Key? key}) : super(key: key);

  @override
  State<DoctorsDetailsPage> createState() => _DoctorsDetailsPageState();
}

class _DoctorsDetailsPageState extends State<DoctorsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / baseWidth;
    final List<int> dates = List.generate(31, (index) => index++);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: const Icon(
      //     Icons.arrow_back_ios,
      //     color: kDarkGrey,
      //   ),
      //   elevation: 0,
      // ),
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
              DoctorCard(
                fem: fem,
                color: Colors.white,
              ),
              CancelAVisitWidget(
                fem: fem,
                text: 'Cancel appointment',
                color: kDarkGrey,
              ),
              addVerticalSpacing(20),
              DoctorStats(fem: fem),
              addVerticalSpacing(30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const LeftAlignedText(
                      text: 'Schedule',
                    ),
                    SizedBox(
                      height: 79 * fem,
                      child: ListView.builder(
                          itemCount: dates.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10, right: 5),
                              child: ReusableContainer(
                                  fem: fem,
                                  width: 75,
                                  height: 75,
                                  borderRadius: 10,
                                  color: kDarkGreyShade400,
                                  child: Text('March ${dates[index]}')),
                            );
                          }),
                    ),
                    addVerticalSpacing(30),
                    const LeftAlignedText(
                      text: 'Time',
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 10,
                      spacing: 20 * fem,
                      direction: Axis.horizontal,
                      children: [
                        ReusableContainer(
                          fem: fem,
                          width: 83 * fem,
                          height: 42 * fem,
                          borderRadius: 10,
                          color: kDarkGreyShade400,
                          child: Text(
                            '11:00',
                            style: kHeaderTextStyleBlack.copyWith(
                                fontSize: 14 * fem),
                          ),
                        ),
                        ReusableContainer(
                          fem: fem,
                          width: 83 * fem,
                          height: 42 * fem,
                          borderRadius: 10,
                          color: kDarkGreyShade400,
                          child: Text(
                            '12:00',
                            style: kHeaderTextStyleBlack.copyWith(
                                fontSize: 14 * fem),
                          ),
                        ),
                        ReusableContainer(
                          fem: fem,
                          width: 83 * fem,
                          height: 42 * fem,
                          borderRadius: 10,
                          color: kDarkGreyShade400,
                          child: Text(
                            '12:00',
                            style: kHeaderTextStyleBlack.copyWith(
                                fontSize: 14 * fem),
                          ),
                        ),
                        ReusableContainer(
                          fem: fem,
                          width: 83 * fem,
                          height: 42 * fem,
                          borderRadius: 10,
                          color: kDarkGreyShade400,
                          child: Text(
                            '12:00',
                            style: kHeaderTextStyleBlack.copyWith(
                                fontSize: 14 * fem),
                          ),
                        ),
                        ReusableContainer(
                          fem: fem,
                          width: 83 * fem,
                          height: 42 * fem,
                          borderRadius: 10,
                          color: kDarkGreyShade400,
                          child: Text(
                            '12:00',
                            style: kHeaderTextStyleBlack.copyWith(
                                fontSize: 14 * fem),
                          ),
                        ),
                        ReusableContainer(
                          fem: fem,
                          width: 83 * fem,
                          height: 42 * fem,
                          color: kDarkGreyShade400,
                          borderRadius: 10,
                          child: Text(
                            '12:00',
                            style: kHeaderTextStyleBlack.copyWith(
                                fontSize: 14 * fem),
                          ),
                        ),
                        ReusableContainer(
                          fem: fem,
                          width: 83 * fem,
                          height: 42 * fem,
                          borderRadius: 10,
                          color: kDarkGreyShade400,
                          child: Text(
                            '12:00',
                            style: kHeaderTextStyleBlack.copyWith(
                                fontSize: 14 * fem),
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpacing(30),
                    CancelAVisitWidget(
                      fem: fem,
                      text: 'Make an appointment',
                      color: kAccentPrimaryGreen,
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
                        'Dr. John Doe is a board certified physician with over 10 years of experience in the field of medicine. He is a graduate of the University of California, San Francisco, School of Medicine. He completed his residency in Internal Medicine at the University of California, San Francisco, Medical Center. He is a member of the American College of Physicians and the American Medical Association.',
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
  });

  final double fem;

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
                        '4.8',
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

class CancelAVisitWidget extends StatelessWidget {
  const CancelAVisitWidget({
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
                DotWidget(fem: fem),
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
  });

  final double fem;
  final Color color;

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
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Assets.imagesImageDrEleanorPena,
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
                    'Dr. Eleanor',
                    style: kHeaderTextStyleBlack.copyWith(
                      fontSize: 18 * fem,
                    ),
                  ),
                ),
                addVerticalSpacing(10),
                Text('Pediatrics',
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
  });

  final double fem;

  @override
  Widget build(BuildContext context) {
    return Container(
      // rectangleRoN (9:882)
      margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 8 * fem, 0 * fem),
      width: 8 * fem,
      height: 8 * fem,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6 * fem),
        color: Colors.white,
      ),
    );
  }
}
