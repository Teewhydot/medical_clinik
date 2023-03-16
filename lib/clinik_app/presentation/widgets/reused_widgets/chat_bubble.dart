// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/custom_time_messages.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/swipable_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatBubble extends StatefulWidget {
  final String message;
  final bool isMe;
  final bool isGroupChat;
  final String cloneName;
  DateTime time;

  ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.cloneName,
    required this.time,
    this.isGroupChat = false,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  String time = '';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('en', MyCustomTimeMessages());
    time = timeago.format(widget.time);
    return SwipeableWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment:
              widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.isMe ? Colors.white : kAccentPrimaryBlue,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(15),
                  topRight: const Radius.circular(15),
                  bottomLeft: widget.isMe
                      ? const Radius.circular(15)
                      : const Radius.circular(0),
                  bottomRight: widget.isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(15),
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.message,
                    style: TextStyle(
                      color: widget.isMe ? kDarkGrey : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  addVerticalSpacing(4),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
