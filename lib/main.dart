import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoea/constants.dart';
import 'package:shoea/welcome_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "Urbanist",
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: kBlackColor,
              onPrimary: kBlackColor,
              secondary: kBlackColor,
              onSecondary: kBlackColor,
              error: kBlackColor,
              onError: kBlackColor,
              background: kBlackColor,
              onBackground: kBlackColor,
              surface: kBlackColor,
              onSurface: kBlackColor)),
      home: const WelcomeScreen(),
    );
  }
}

