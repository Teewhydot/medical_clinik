import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: kDarkGrey,
        ),
        elevation: 0,
      ),
      backgroundColor: kScaffoldColor,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
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
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 18 * fem, 0 * fem),
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 74 * fem, 0 * fem, 0 * fem),
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
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 64 * fem, 0 * fem),
                    width: 154 * fem,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 2 * fem),
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
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 30 * fem, 0 * fem),
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
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 9 * fem, 0 * fem, 3 * fem),
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 54 * fem),
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
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(18 * fem, 18 * fem, 18 * fem, 17 * fem),
                decoration: BoxDecoration(
                  color: kDarkGrey,
                  borderRadius: BorderRadius.circular(10 * fem),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        DotWidget(fem: fem),
                        Text(
                          'Сancel a visit',
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
            ),
            addVerticalSpacing(20),
            Column(
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
                    Container(
                      height: 58,
                      width: 117 * fem,
                      decoration: BoxDecoration(
                        color: kDarkGreyShade400,
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Center(
                        child: Text(
                          '+423',
                          style: kHeaderTextStyleBlack.copyWith(
                            fontSize: 18 * fem,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 58,
                      width: 117 * fem,
                      decoration: BoxDecoration(
                        color: kDarkGreyShade400,
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Center(
                        child: Text(
                          '+8Yrs',
                          style: kHeaderTextStyleBlack.copyWith(
                            fontSize: 18 * fem,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 58,
                      width: 117 * fem,
                      decoration: BoxDecoration(
                        color: kDarkGreyShade400,
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
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
                            Icon(Icons.star,
                                color: kAccentPrimaryPurple, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
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
