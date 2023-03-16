// ignore_for_file: use_build_context_synchronously, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:medical_clinik/clinik_app/domain/functions/firebase_functions.dart';
import 'package:medical_clinik/clinik_app/domain/functions/scroll_to_bottom.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/doctor_details.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/chat_bubble.dart';
import 'package:medical_clinik/generated/assets.dart';
import 'package:toast/toast.dart';

class ChatScreen extends StatefulWidget {
  final String cloneName;
  final String userName;
  const ChatScreen(this.cloneName, this.userName, {super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Stream<QuerySnapshot> chatStream;
  bool isSending = false;
  void startSpinning() {
    setState(() {
      isSending = true;
    });
  }

  void stopSpinning() {
    setState(() {
      isSending = false;
    });
  }

  final fireStore = FirebaseFirestore.instance;
  final TextEditingController chatController = TextEditingController();
  bool isSwitchedOn = false;

  void toggleSwitch(bool isSwitchOn) {
    setState(() {
      isSwitchedOn = !isSwitchedOn;
    });
  }

  @override
  void initState() {
    super.initState();
    chatStream = fireStore
        .collection(widget.userName)
        .doc(widget.userName)
        .collection('clones')
        .doc(widget.cloneName)
        .collection('chats')
        .orderBy('time', descending: false)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final fem = MediaQuery.of(context).size.width / baseWidth;

    bool hasInternet;
    ToastContext().init(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: kScaffoldColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kDarkGrey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesImageDrJaneCooper,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        addHorizontalSpacing(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cloneName,
                              style: kHeaderTextStyleBlack,
                            ),
                            Row(
                              children: [
                                DotWidget(
                                  fem: fem,
                                  color: kAccentPrimaryGreen,
                                ),
                                Text(
                                  'Online',
                                  style: kSubHeaderTextStyleGrey,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(Assets.iconsChat,
                            width: 40, height: 40, fit: BoxFit.cover),
                        Switch.adaptive(
                            value: isSwitchedOn,
                            onChanged: (value) async {
                              toggleSwitch(value);
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: chatStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ScrollToBottom(
                      child: ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ChatBubble(
                            message: data['messageText'],
                            cloneName: widget.cloneName,
                            isMe: data['whoSent'] == 'sender',
                            time: data['time'].toDate(),
                          );
                        }).toList(),
                      ),
                    );
                  }),
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: [
                      addHorizontalSpacing(10),
                      Expanded(
                        flex: 4,
                        child: TextField(
                          controller: chatController,
                          textInputAction: TextInputAction.send,
                          cursorColor: Colors.black,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          onChanged: (newValue) {},
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                  style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () async {
                                    startSpinning();
                                    hasInternet =
                                        await InternetConnectionChecker()
                                            .hasConnection;
                                    if (chatController.text.isEmpty) {
                                      Toast.show("Cannot send an empty message",
                                          duration: Toast.lengthShort,
                                          gravity: Toast.center,
                                          backgroundColor: Colors.red);
                                      stopSpinning();
                                    } else if (hasInternet == false) {
                                      Toast.show("No internet connection",
                                          duration: Toast.lengthShort,
                                          gravity: Toast.center,
                                          backgroundColor: Colors.red);
                                      stopSpinning();
                                    } else {
                                      await addMessageToFirebase(
                                          chatController.text,
                                          context,
                                          widget.cloneName,
                                          isSwitchedOn);
                                      chatController.clear();
                                      stopSpinning();
                                    }
                                  },
                                  child: CircleAvatar(
                                      backgroundColor: kAccentPrimaryGreen,
                                      child: isSending
                                          ? const SizedBox(
                                              height: 25,
                                              width: 25,
                                              child: LoadingIndicator(
                                                  indicatorType:
                                                      Indicator.semiCircleSpin,
                                                  colors: [Colors.white],
                                                  strokeWidth: 2,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  pathBackgroundColor:
                                                      Colors.transparent),
                                            )
                                          : const Icon(
                                              Icons.telegram,
                                              color: Colors.white,
                                            ))),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: 'Type Something...',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      addHorizontalSpacing(10),
                    ],
                  ),
                ),
                addVerticalSpacing(10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
