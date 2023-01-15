import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: primaryColour,
        body: Center(
            child: Text(
          "MEDISAFE",
          style: GoogleFonts.poppins(textStyle: font123),
        )),
      ),
    );
  }
}
