import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';

class SwipeableWidget extends StatelessWidget {
  final Widget child;

  const SwipeableWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      groupTag: 0,
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: null,
            backgroundColor: kAccentPrimaryGreen,
            foregroundColor: Colors.white,
            icon: Icons.call,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            autoClose: true,
            label: 'Call',
          ),
        ],
      ),
      child: child,
    );
  }
}
