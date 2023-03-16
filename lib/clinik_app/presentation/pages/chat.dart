// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/add_new_chat.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/conversation_list.dart';

class FlashChat extends StatefulWidget {
  final String userName;

  const FlashChat({super.key, required this.userName});

  @override
  State<FlashChat> createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
  Map<String, dynamic> data = {};
  static List<ConversationList> conversationList = [];
  List<ConversationList> displayList = List.from(conversationList);
  final fireStore = FirebaseFirestore.instance;
  var newUserName;
  late Stream<QuerySnapshot> cloneStream;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cloneStream = fireStore
        .collection(widget.userName)
        .doc(widget.userName)
        .collection('clones')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    void awaitCloneNameFromModalPopup(BuildContext context) async {
      // start the SecondScreen and wait for it to finish with a result
      await showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => const AddNewUserClone());
    }

    return Scaffold(
      backgroundColor: kScaffoldColor,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle_outlined),
          onPressed: () {
            awaitCloneNameFromModalPopup(context);
          }),
      appBar: AppBar(
        backgroundColor: kScaffoldColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: const [
                  Text(
                    'Chats',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          addVerticalSpacing(10),
          Expanded(
            flex: 15,
            child: StreamBuilder<QuerySnapshot>(
                stream: cloneStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                    );
                  }
                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return ConversationList(
                        data['cloneName'],
                        widget.userName,
                      );
                    }).toList(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
