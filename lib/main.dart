import 'package:embassy/button.dart';
import 'package:embassy/feedback.dart';
import 'package:embassy/globals.dart';
import 'package:embassy/phoneinput.dart';
import 'package:embassy/thankyou.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool verydisatisfy = false;
  bool disatisfy = false;
  bool neutral = false;
  bool satisfy = false;
  bool happy = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Text(
                "Client Informations",
                style: GoogleFonts.poppins(
                    // color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  Text(
                    "Please Enter Your Mobile Number?",
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  Text(
                    "*",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InputPhone(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                "How do you feel about the level of service ?",
                style: GoogleFonts.poppins(
                    color: Color(0xff20376A),
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                      size: MediaQuery.of(context).size.width * 0.16,
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
                      size: MediaQuery.of(context).size.width * 0.16,
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
                      size: MediaQuery.of(context).size.width * 0.16,
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
                      size: MediaQuery.of(context).size.width * 0.16,
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
                      size: MediaQuery.of(context).size.width * 0.16,
                      color: happy ? Colors.yellow : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            //               padding: const EdgeInsets.symmetric(vertical: 25),

            Container(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Custombutton(
                      buttontext: "Back",
                      buttonbgcolor: Color(0xff20376A),
                      buttonheight: MediaQuery.of(context).size.height * 0.06,
                      buttontxtcolor: Colors.white,
                      buttonwidth: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (verydisatisfy == true ||
                        disatisfy == true ||
                        neutral == true ||
                        satisfy == true ||
                        happy == true) {
                      if (numberok == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Thankyou()));
                      }
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Custombutton(
                      buttontext: "Submit",
                      buttonbgcolor: Color(0xff20376A),
                      buttonheight: MediaQuery.of(context).size.height * 0.06,
                      buttontxtcolor: Colors.white,
                      buttonwidth: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
