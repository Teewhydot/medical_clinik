import 'package:flutter/material.dart';

class DoctorDetailsWidget extends StatelessWidget {
  const DoctorDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Column(),
          Column(),
          Column(),
        ],
      ),
    );
  }
}
