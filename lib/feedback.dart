import 'package:embassy/button.dart';
import 'package:embassy/thankyou.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Feedbackform extends StatefulWidget {
  @override
  _FeedbackformState createState() => _FeedbackformState();
}

class _FeedbackformState extends State<Feedbackform> {
  bool verydisatisfy = false;
  bool disatisfy = false;
  bool neutral = false;
  bool satisfy = false;
  bool happy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff20376A),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff20376A),
                  image: DecorationImage(
                      image: AssetImage(
                        "images/banner.jpg",
                        // "widget.ndimage"
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  "How do you feel about the level of service ?",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          verydisatisfy = true;
                          disatisfy = false;
                          neutral = false;
                          satisfy = false;
                          happy = false;
                        });
                      },
                      child: Icon(
                        Icons.sentiment_very_dissatisfied_rounded,
                        size: 70,
                        color: verydisatisfy ? Colors.yellow : Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          verydisatisfy = false;
                          disatisfy = true;
                          neutral = false;
                          satisfy = false;
                          happy = false;
                        });
                      },
                      child: Icon(
                        Icons.sentiment_dissatisfied_rounded,
                        size: 70,
                        color: disatisfy ? Colors.yellow : Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          verydisatisfy = false;
                          disatisfy = false;
                          neutral = true;
                          satisfy = false;
                          happy = false;
                        });
                      },
                      child: Icon(
                        Icons.sentiment_neutral_rounded,
                        size: 70,
                        color: neutral ? Colors.yellow : Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          verydisatisfy = false;
                          disatisfy = false;
                          neutral = false;
                          satisfy = true;
                          happy = false;
                        });
                      },
                      child: Icon(
                        Icons.sentiment_satisfied_alt_rounded,
                        size: 70,
                        color: satisfy ? Colors.yellow : Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          verydisatisfy = false;
                          disatisfy = false;
                          neutral = false;
                          satisfy = false;
                          happy = true;
                        });
                      },
                      child: Icon(
                        Icons.sentiment_very_satisfied_rounded,
                        size: 70,
                        color: happy ? Colors.yellow : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (verydisatisfy == true ||
                          disatisfy == true ||
                          neutral == true ||
                          satisfy == true ||
                          happy == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Thankyou()));
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Custombutton(
                        buttontext: "Submit",
                        buttonbgcolor: Colors.white,
                        buttonheight: MediaQuery.of(context).size.height * 0.06,
                        buttontxtcolor: Color(0xff20376A),
                        buttonwidth: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
