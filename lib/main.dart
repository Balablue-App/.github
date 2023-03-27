import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/screens/splash/splash.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Balablue app',
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        initialRoute: Splash.routeName,
        getPages: appRoutes);
  }
}
