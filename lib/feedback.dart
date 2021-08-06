import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Feedbackform extends StatefulWidget {
  const Feedbackform({Key? key}) : super(key: key);

  @override
  _FeedbackformState createState() => _FeedbackformState();
}

class _FeedbackformState extends State<Feedbackform> {
  List<bool> isTypeSelected = [false, false, false, true, true];
  final _dialog = RatingDialog(
    title: 'App name',
    message:
        'Tap a star to set your rating. Add more description here if you want.',
    image: const FlutterLogo(size: 100),
    submitButton: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      // TODO: add your own logic
      if (response.rating < 3.0) {
      } else {
        // _rateAndReviewApp();
      }
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [Text("Give us a "), Text("Feedback!")],
              ),
              GestureDetector(
                child: buildCheckItem(
                    title: "Issue 0", isSelected: isTypeSelected[0]),
                onTap: () {
                  setState(() {
                    isTypeSelected[1] = !isTypeSelected[0];
                  });
                },
              ),
              GestureDetector(
                child: buildCheckItem(
                    title: "Issue 1", isSelected: isTypeSelected[1]),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => _dialog,
                      barrierDismissible: true);
                  setState(() {
                    isTypeSelected[1] = !isTypeSelected[1];
                  });
                },
              ),
              GestureDetector(
                child: buildCheckItem(
                    title: "Issue 2", isSelected: isTypeSelected[2]),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => _dialog,
                      barrierDismissible: true);
                  setState(() {
                    isTypeSelected[2] = !isTypeSelected[2];
                  });
                },
              ),
              GestureDetector(
                child: buildCheckItem(
                    title: "Issue 3", isSelected: isTypeSelected[3]),
                onTap: () {
                  setState(() {
                    isTypeSelected[3] = !isTypeSelected[3];
                  });
                },
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => _dialog,
                        barrierDismissible: true);
                  },
                  child: Text("Rate Us")),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCheckItem({required String title, required bool isSelected}) {
  return Container(
    padding: const EdgeInsets.all(6.0),
    child: Row(
      children: [
        Icon(
          isSelected ? Icons.check_circle : Icons.circle,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blue : Colors.grey),
        ),
      ],
    ),
  );
}
