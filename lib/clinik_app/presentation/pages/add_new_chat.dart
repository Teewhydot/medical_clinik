// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:medical_clinik/clinik_app/domain/functions/firebase_functions.dart';
import 'package:medical_clinik/clinik_app/presentation/widgets/constants/constants.dart';
import 'package:toast/toast.dart';

class AddNewUserClone extends StatefulWidget {
  const AddNewUserClone({Key? key}) : super(key: key);

  @override
  State<AddNewUserClone> createState() => _AddNewUserCloneState();
}

class _AddNewUserCloneState extends State<AddNewUserClone> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    bool hasInternet;
    final nav = Navigator.of(context);
    ToastContext().init(context);
    final TextEditingController cloneNameController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color(0xff757575),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              addVerticalSpacing(10),
              const Text(
                'Create a new clone',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              addVerticalSpacing(20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: cloneNameController,
                  cursorColor: Colors.black,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff759090),
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                          style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: "Enter your clones' name",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                  ),
                ),
              ),
              addVerticalSpacing(10),
              SizedBox(
                width: 150,
                height: 30,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    hasInternet =
                        await InternetConnectionChecker().hasConnection;
                    if (cloneNameController.text.isEmpty) {
                      Toast.show("Type in a valid name",
                          duration: Toast.lengthShort,
                          gravity: Toast.center,
                          backgroundColor: Colors.amberAccent.shade700);
                      setState(() {
                        isLoading = false;
                      });
                    } else if (hasInternet == false) {
                      Toast.show("No internet connection",
                          duration: Toast.lengthShort,
                          gravity: Toast.center,
                          backgroundColor: Colors.amberAccent.shade700);
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      bool cloneExists = await checkExist(
                          cloneNameController.text.trim(), context);
                      if (cloneExists) {
                        Toast.show("Clone already exists",
                            backgroundColor: Colors.amberAccent.shade700,
                            duration: Toast.lengthShort,
                            gravity: Toast.center);
                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        cloneNameController.clear();
                        setState(() {
                          isLoading = false;
                        });
                        nav.pop();
                        Toast.show('Clone created successfully',
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
                      : const Text('Create Clone'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
