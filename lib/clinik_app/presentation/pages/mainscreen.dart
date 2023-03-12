import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/home_page.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/generated/assets.dart';

import 'chat.dart';
import 'profile.dart';
import 'receipt.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const Receipt(),
    const Chat(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        height: 88,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white),
        padding: const EdgeInsets.all(5),
        width: 375,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: SizedBox(
                    height: 54,
                    width: 60,
                    child: Image.asset(
                      pageIndex != 0
                          ? Assets.iconsHomeUnselected
                          : Assets.iconsHomeSelected,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 1;
                      });
                    },
                    child: SizedBox(
                        height: 54,
                        width: 60,
                        child: Image.asset(
                          pageIndex != 1
                              ? Assets.iconsReceiptUnselected
                              : Assets.iconsReceiptSelected,
                        ))),
              ],
            ),
            const CircleAvatar(
              radius: 30,
              backgroundColor: kAccentPrimaryGreen,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                    child: SizedBox(
                        height: 54,
                        width: 60,
                        child: Image.asset(
                          pageIndex != 2
                              ? Assets.iconsChatUnselected
                              : Assets.iconsChatSelected,
                        ))),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 3;
                      });
                    },
                    child: SizedBox(
                        height: 54,
                        width: 60,
                        child: Image.asset(
                          Assets.iconsProfileUnselected,
                        ))),
              ],
            ),
          ],
        ),
      ),
      body: pages[pageIndex],
    );
  }
}
