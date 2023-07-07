// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoea/constants.dart';
import 'package:shoea/screens/login/signup_with.dart';
import 'package:shoea/screens/onboarding/unboarding_content.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: content.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Image.asset(
                      content[i].image,
                      height: 0.6 * height,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Text(
                        content[i].caption,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listDots(currentIndex),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  if (currentIndex == content.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SignUpWith(),
                      ),
                    );
                  }
                  _pageController.nextPage(
                      duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
                },
                child: Text(
                  currentIndex==content.length-1?"Next":"Continue",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> dotslist = [];
double index = 0;
List<Widget> listDots(int index) {
  dotslist = [];
  for (double i = 0; i<content.length; i++) {
    dotslist.add(
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Container(
          margin: EdgeInsets.only(right: 5),
          color: index==i?kBlueColor:kBlackColor,
          width: index==i?40:20,
          height: 20,
        ),
      ),
    );
  }
  return dotslist;
}
