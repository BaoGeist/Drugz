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
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 100),
                  decoration: BoxDecoration(
                      color: secondaryColour,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(80))),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 40, top: 80),
                child: Icon(Icons.camera_alt_rounded,
                    size: 100, color: Colors.white),
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Text(
                  "You scan your medications barcode",
                  style: titles,
                ),
              ),
              Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      color: secondaryColour,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      "Swipe",
                      textAlign: TextAlign.center,
                      style: textbox2,
                    ),
                  )),
              Expanded(flex: 1, child: Container())
            ]),
          ),
          Container(
            color: Color.fromARGB(255, 73, 102, 75),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 100),
                  decoration: BoxDecoration(
                      color: secondaryColour,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(80))),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 40, top: 80),
                child: Icon(Icons.search, size: 100, color: Colors.white),
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Text(
                  "We search the web for any risks",
                  style: titles,
                ),
              ),
              Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      color: secondaryColour,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      "Swipe",
                      textAlign: TextAlign.center,
                      style: textbox2,
                    ),
                  )),
              Expanded(flex: 1, child: Container())
            ]),
          ),
          Container(
            color: Color(0xffC1E1C1),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 100),
                  decoration: BoxDecoration(
                      color: secondaryColour,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(80))),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 40, top: 80),
                child: Icon(Icons.stay_current_portrait_rounded,
                    size: 100, color: Colors.white),
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Text(
                  "And display it to you in a second.",
                  style: titles,
                ),
              ),
              Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      color: secondaryColour,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: textbox2,
                    ),
                  )),
              Expanded(flex: 1, child: Container())
            ]),
          )
        ],
      ),
    );
  }
}
