import 'package:flutter/material.dart';

class Custombutton extends StatefulWidget {
  String buttontext = '';
  Color buttonbgcolor;
  Color buttontxtcolor;

  var buttonwidth;
  var buttonheight;

  Custombutton(
      {required this.buttontext,
      required this.buttonbgcolor,
      required this.buttonheight,
      required this.buttontxtcolor,
      required this.buttonwidth});

  @override
  _CustombuttonState createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: MediaQuery.of(context).size.width * widget.buttonwidth,
      height: MediaQuery.of(context).size.height * widget.buttonheight,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: widget.buttonbgcolor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
      ),
      child: new Text(
        widget.buttontext,
        style: new TextStyle(
          color: widget.buttontxtcolor,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
      ),
    ));
  }
}
