import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/domain/functions/get_user_status.dart';
import 'package:medical_clinik/clinik_app/presentation/manager/providers/username_provider.dart';
import 'package:provider/provider.dart';

Future<void> addMessageToFirebase(String message, BuildContext context,
    String cloneName, bool isClone) async {
  final fireStore = FirebaseFirestore.instance;
  final provider = Provider.of<UserNameProvider>(context, listen: false);

  await fireStore
      .collection(provider.name)
      .doc(provider.name)
      .collection('clones')
      .doc(cloneName)
      .collection('chats')
      .add({
    'messageText': message,
    'whoSent': getUserStatus(isClone),
    'time': DateTime.now(),
  });
}

Future<void> deleteClone(String cloneName, BuildContext context) {
  final nameProvider = Provider.of<UserNameProvider>(context, listen: false);
  final fireStore = FirebaseFirestore.instance;
  return fireStore
      .collection(nameProvider.name)
      .doc(nameProvider.name)
      .collection('clones')
      .doc(cloneName)
      .delete();
}

Future<void> addCloneToFirebase(String cloneName, BuildContext context) async {
  final fireStore = FirebaseFirestore.instance;
  final provider = Provider.of<UserNameProvider>(context, listen: false);
  await fireStore
      .collection(provider.name)
      .doc(provider.name)
      .collection('clones')
      .doc(cloneName)
      .set({
    'cloneName': cloneName,
  });

  await fireStore
      .collection(provider.name)
      .doc(provider.name)
      .collection('clones')
      .doc(cloneName)
      .collection('chats')
      .add({
    'messageText':
        'Hello, I am $cloneName, Tell me what brings you to me today',
    'whoSent': 'receiver',
    'time': DateTime.now(),
  });
}

Future<bool> checkExist(String cloneId, BuildContext context) async {
  bool exist = false;
  final provider = Provider.of<UserNameProvider>(context, listen: false);
  final fireStore = FirebaseFirestore.instance;
//checks if the clone name already exists, returns true if yes and false if no.
  await fireStore
      .collection(provider.name)
      .doc(provider.name)
      .collection('clones')
      .doc(cloneId)
      .get()
      .then((value) => exist = value.exists);
  return exist;
}
