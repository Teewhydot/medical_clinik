// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:medical_clinik/clinik_app/presentation/manager/providers/username_provider.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class CreateUserNamePage extends StatefulWidget {
  const CreateUserNamePage({super.key});

  @override
  State<CreateUserNamePage> createState() => _CreateUserNamePageState();
}

class _CreateUserNamePageState extends State<CreateUserNamePage> {
  final fireStore = FirebaseFirestore.instance;

  final TextEditingController _userNameController = TextEditingController();
  String userName = '';
  bool isLoading = false;
  Future<void> saveUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('userName', userName);
  }

  @override
  Widget build(BuildContext context) {
    bool hasInternet;
    ToastContext().init(context);

    Future<bool> checkExist(String docID) async {
      bool exist = false;
      await fireStore
          .collection(_userNameController.text)
          .doc(_userNameController.text)
          .collection('clones')
          .doc(docID)
          .get()
          .then((value) => exist = value.exists);
      return exist;
    }

    final provider = Provider.of<UserNameProvider>(context, listen: false);
    return Consumer<UserNameProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addVerticalSpacing(30),
                    const Text('Set your username',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: kScaffoldColor)),
                    addVerticalSpacing(30),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _userNameController,
                        onChanged: (value) {
                          userName = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter a unique username',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    addVerticalSpacing(15),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {
                          hasInternet =
                              await InternetConnectionChecker().hasConnection;
                          if (_userNameController.text.isEmpty) {
                            Toast.show("Type in a valid name",
                                duration: Toast.lengthShort,
                                gravity: Toast.center,
                                backgroundColor: Colors.amberAccent.shade700);
                          } else if (hasInternet == false) {
                            Toast.show("No internet connection",
                                duration: Toast.lengthShort,
                                gravity: Toast.center,
                                backgroundColor: Colors.amberAccent.shade700);
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            bool cloneExists = await checkExist(
                                _userNameController.text.trim());
                            if (cloneExists) {
                              Toast.show("Username already exists",
                                  backgroundColor: Colors.amberAccent.shade700,
                                  duration: Toast.lengthShort,
                                  gravity: Toast.center);
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              await saveUserName();
                              provider.setName(_userNameController.text.trim());
                              await fireStore
                                  .collection(_userNameController.text.trim())
                                  .doc(_userNameController.text)
                                  .set({
                                'User': _userNameController.text,
                              });
                              _userNameController.clear();
                              setState(() {
                                isLoading = false;
                              });
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => FlashChat(
                              //               userName: userName,
                              //             )));
                              Toast.show('Username created successfully',
                                  duration: Toast.lengthShort,
                                  backgroundColor: const Color(0xff903aff),
                                  gravity: Toast.center);
                            }
                          }
                        },
                        child: isLoading
                            ? Row(
                                children: [
                                  const LoadingIndicator(
                                      indicatorType: Indicator.ballPulse,
                                      colors: [Colors.white],
                                      strokeWidth: 2,
                                      backgroundColor: Colors.transparent,
                                      pathBackgroundColor: Colors.transparent),
                                  addHorizontalSpacing(10),
                                  const Text('Please wait'),
                                ],
                              )
                            : const Text('Set username'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
