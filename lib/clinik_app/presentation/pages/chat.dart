// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/reused_widgets/conversation_list.dart';

class MedikalChat extends StatefulWidget {
  final String userName;

  const MedikalChat({super.key, required this.userName});

  @override
  State<MedikalChat> createState() => _MedikalChatState();
}

class _MedikalChatState extends State<MedikalChat> {
  Map<String, dynamic> data = {};
  static List<ConversationList> conversationList = [];
  List<ConversationList> displayList = List.from(conversationList);
  final fireStore = FirebaseFirestore.instance;
  var newUserName;
  late Stream<QuerySnapshot> chatStream;
  late Stream<QuerySnapshot> imageStream;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chatStream = fireStore
        .collection(widget.userName)
        .doc(widget.userName)
        .collection('clones')
        .snapshots();
    imageStream = fireStore
        .collection(widget.userName)
        .doc(widget.userName)
        .collection('clones')
        .doc(widget.userName)
        .collection('imagePath')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle_outlined), onPressed: () {}),
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
                stream: chatStream,
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
                          cloneNameFromFirestore: data['cloneName'],
                          userName: widget.userName,
                          imagePath: data['imagePath']);
                    }).toList(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
