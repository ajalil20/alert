import 'package:embassy/button.dart';
import 'package:embassy/feedback.dart';
import 'package:embassy/globals.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InputPhone extends StatefulWidget {
  @override
  _InputPhoneState createState() => _InputPhoneState();
}

class _InputPhoneState extends State<InputPhone> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
                numberok = value;
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: controller,
              formatInput: false,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 30),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       // GestureDetector(
            //       //   onTap: () {
            //       //     formKey.currentState!.validate();
            //       //     if (numberok == true) {
            //       //       Navigator.push(
            //       //           context,
            //       //           MaterialPageRoute(
            //       //               builder: (context) => Feedbackform()));
            //       //     }
            //       //   },
            //       //   child: Container(
            //       //     height: MediaQuery.of(context).size.height * 0.06,
            //       //     width: MediaQuery.of(context).size.width * 0.4,
            //       //     child: Custombutton(
            //       //       buttontext: "Submit",
            //       //       buttonbgcolor: Color(0xff20376A),
            //       //       buttonheight: MediaQuery.of(context).size.height * 0.06,
            //       //       buttontxtcolor: Colors.white,
            //       //       buttonwidth: MediaQuery.of(context).size.width * 0.4,
            //       //     ),
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),

            // ElevatedButton(
            //   onPressed: () {
            //     formKey.currentState!.validate();
            //   },
            //   child: Text('Validate'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     getPhoneNumber('+15417543010');
            //   },
            //   child: Text('Update'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     formKey.currentState!.save();
            //   },
            //   child: Text('Save'),
            // ),
          ],
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
