// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shoea/welcome_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>WelcomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    // ignore: prefer_const_literals_to_create_immutables
                  ),
                  child: Image.asset(
                    'images/logo1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Shoea",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // CircularProgressIndicator(color: Colors.grey,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80.0, top: 200.0),
              child: SizedBox(
                height: 70,
                width: 70,
                child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,
                    colors: const [Colors.black],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
