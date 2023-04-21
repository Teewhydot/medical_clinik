import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical_clinik/clinik_app/presentation/manager/providers/chat_provider.dart';
import 'package:medical_clinik/clinik_app/presentation/manager/providers/delete_clone_provider.dart';
import 'package:medical_clinik/clinik_app/presentation/manager/providers/username_provider.dart';
import 'package:medical_clinik/clinik_app/presentation/pages/home_page.dart';
import 'package:medical_clinik/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setInt('initScreen', 1);
  final userNameFromStorage = sharedPreferences.getString('userName') ?? '';
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => UserNameProvider(userNameFromStorage)),
    ChangeNotifierProvider(create: (context) => ChatProvider()),
    ChangeNotifierProvider(create: (context) => DeleteCloneProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WidgetSwitcher(
      //   widget1: MedicalClinik(),
      //   widget2: IntroPageOne(),
      // ),
      home: HomePage(),
    );
  }
}
