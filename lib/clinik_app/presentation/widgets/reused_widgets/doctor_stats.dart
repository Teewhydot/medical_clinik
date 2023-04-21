import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/reusable_container.dart';

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
