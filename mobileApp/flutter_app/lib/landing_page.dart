import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: primaryColour, body: onBoardingScreen()),
    );
  }
}

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: primaryColour,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 40),
                child: Icon(Icons.camera_alt_rounded,
                    size: 100, color: Colors.white),
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Text(
                  "Scan your medications barcode",
                  style: titles,
                ),
              ),
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    color: secondaryColour,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              )
            ]),
          ),
          Container(
            color: Color.fromARGB(255, 73, 102, 75),
          ),
          Container(color: Color(0xffC1E1C1))
        ],
      ),
    );
  }
}
