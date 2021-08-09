import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Thankyou extends StatefulWidget {
  const Thankyou({Key? key}) : super(key: key);

  @override
  _ThankyouState createState() => _ThankyouState();
}

class _ThankyouState extends State<Thankyou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff20376A),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Text(
                  "Thank you for your Feedback",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 27),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
