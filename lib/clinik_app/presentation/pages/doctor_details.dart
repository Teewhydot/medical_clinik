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
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 235,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios),
                      Text('Back'),
                    ],
                  ),
                  addVerticalSpacing(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(Assets.imagesImageDrEleanorPena),
                              addHorizontalSpacing(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Dr. Eleanor Pena',
                                      ),
                                      Text(
                                        'Pediatrician',
                                      )
                                    ],
                                  ),
                                  addVerticalSpacing(10),
                                  Row(
                                    children: [
                                      Image.asset(
                                        Assets.iconsChat,
                                        width: 33,
                                        height: 33,
                                      ),
                                      addHorizontalSpacing(10),
                                      Image.asset(
                                        Assets.iconsCall,
                                        width: 33,
                                        height: 33,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.menu),
                          Row(
                            children: const [Text('\$80')],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
