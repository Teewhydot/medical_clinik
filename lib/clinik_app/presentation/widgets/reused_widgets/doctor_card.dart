// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:medical_clinik/clinik_app/domain/functions/firebase_functions.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/generated/assets.dart';
import 'package:toast/toast.dart';

class DoctorCard extends StatefulWidget {
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
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool? hasInternet;
  bool? isLoading;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.fromLTRB(
          2 * widget.fem, 0 * widget.fem, 0 * widget.fem, 0 * widget.fem),
      height: 120 * widget.fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem,
                18 * widget.fem, 0 * widget.fem),
            padding: EdgeInsets.fromLTRB(0 * widget.fem, 74 * widget.fem,
                0 * widget.fem, 0 * widget.fem),
            width: 100 * widget.fem,
            height: 100 * widget.fem,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.image,
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
            margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem,
                64 * widget.fem, 0 * widget.fem),
            width: 154 * widget.fem,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem,
                      0 * widget.fem, 2 * widget.fem),
                  child: Text(
                    widget.name,
                    style: kHeaderTextStyleBlack.copyWith(
                      fontSize: 18 * widget.fem,
                    ),
                  ),
                ),
                addVerticalSpacing(10),
                Text(widget.profession,
                    style: kSubHeaderTextStyleGrey.copyWith(
                      fontSize: 14 * widget.fem,
                    )),
                addVerticalSpacing(10),
                Container(
                  margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem,
                      30 * widget.fem, 0 * widget.fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * widget.fem,
                            0 * widget.fem, 14 * widget.fem, 0 * widget.fem),
                        width: 40 * widget.fem,
                        height: 40 * widget.fem,
                        child: Image.asset(
                          Assets.iconsCall,
                          width: 40 * widget.fem,
                          height: 40 * widget.fem,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          hasInternet =
                              await InternetConnectionChecker().hasConnection;
                          if (hasInternet == false) {
                            Toast.show("No internet connection",
                                duration: Toast.lengthShort,
                                gravity: Toast.center,
                                backgroundColor: Colors.amberAccent.shade700);
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            bool cloneExists =
                                await checkExist(widget.name.trim(), context);
                            if (cloneExists) {
                              Toast.show("Chat already exists",
                                  backgroundColor: Colors.amberAccent.shade700,
                                  duration: Toast.lengthShort,
                                  gravity: Toast.center);
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              addCloneToFirebase(widget.name, context);
                              setState(() {
                                isLoading = false;
                              });
                              Toast.show(
                                  'Chat created successfully with Dr. ${widget.name}',
                                  duration: Toast.lengthShort,
                                  backgroundColor: const Color(0xff903aff),
                                  gravity: Toast.center);
                            }
                          }
                        },
                        child: SizedBox(
                          width: 40 * widget.fem,
                          height: 40 * widget.fem,
                          child: isLoading == true
                              ? const LoadingIndicator(
                                  indicatorType: Indicator.ballPulse,
                                  colors: [kAccentPrimaryGreen],
                                  strokeWidth: 2,
                                  backgroundColor: Colors.transparent,
                                  pathBackgroundColor: Colors.transparent)
                              : Image.asset(
                                  Assets.iconsChatSelected,
                                  width: 40 * widget.fem,
                                  height: 40 * widget.fem,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                0 * widget.fem, 9 * widget.fem, 0 * widget.fem, 3 * widget.fem),
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem,
                      0 * widget.fem, 54 * widget.fem),
                  width: 26 * widget.fem,
                  height: 6 * widget.fem,
                  child: Image.asset(
                    Assets.imagesIconEllipses,
                    width: 26 * widget.fem,
                    height: 6 * widget.fem,
                  ),
                ),
                Text(
                  '\$80',
                  style: kSubHeaderTextStyleGrey.copyWith(
                      fontSize: 28 * widget.fem, color: kDarkGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
