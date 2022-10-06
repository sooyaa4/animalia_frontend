// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool submitValid = false;
  EmailAuth emailAuth;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void sendOtp() async {
    emailAuth.sessionName = "Sample session";
    var res = await emailAuth.sendOtp(recipientMail: _emailController.text);
    if (res) {
      print("Otp send");
    } else {
      print("gabisa ngirim otp");
    }
  }

  void verify() async {
    emailAuth.sessionName = "Test Session";
    var res = await emailAuth.validateOtp(
        recipientMail: _emailController.text, userOtp: _otpController.text);
    if (res) {
      print("Otp verifed");
    } else {
      print("invalid otp");
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     resizeToAvoidBottomInset: false,
  //     backgroundColor: Color(0xfff7f6fb),
  //     body: SafeArea(
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
  //         child: Column(
  //           children: [
  //             Align(
  //               alignment: Alignment.topLeft,
  //               child: GestureDetector(
  //                 onTap: () => Navigator.pop(context),
  //                 child: Icon(
  //                   Icons.arrow_back,
  //                   size: 32,
  //                   color: Colors.black54,
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 18,
  //             ),
  //             Container(
  //               width: 200,
  //               height: 200,
  //               decoration: BoxDecoration(
  //                 color: Colors.deepPurple.shade50,
  //                 shape: BoxShape.circle,
  //               ),
  //               child: Image.asset(
  //                 'assets/animalia11.png',
  //               ),
  //             ),
  //             SizedBox(
  //               height: 24,
  //             ),
  //             Text(
  //               'Verification',
  //               style: TextStyle(
  //                 fontSize: 22,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               "Enter your OTP code number",
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.black38,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(
  //               height: 19,
  //             ),
  //             Container(
  //               padding: EdgeInsets.all(5),
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       _textFieldOTP(first: true, last: false),
  //                       _textFieldOTP(first: false, last: false),
  //                       _textFieldOTP(first: false, last: false),
  //                       _textFieldOTP(first: false, last: true),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: 22,
  //                   ),
  //                   SizedBox(
  //                     width: double.infinity,
  //                     child: ElevatedButton(
  //                       onPressed: () {},
  //                       style: ButtonStyle(
  //                         foregroundColor:
  //                             MaterialStateProperty.all<Color>(Colors.white),
  //                         backgroundColor:
  //                             MaterialStateProperty.all<Color>(Colors.purple),
  //                         shape:
  //                             MaterialStateProperty.all<RoundedRectangleBorder>(
  //                           RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(24.0),
  //                           ),
  //                         ),
  //                       ),
  //                       child: Padding(
  //                         padding: EdgeInsets.all(14.0),
  //                         child: Text(
  //                           'Verify',
  //                           style: TextStyle(fontSize: 16),
  //                         ),
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: 18,
  //             ),
  //             Text(
  //               "Didn't you receive any code?",
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.black38,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(
  //               height: 18,
  //             ),
  //             Text(
  //               "Resend New Code",
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.purple,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _textFieldOTP({bool first, last}) {
  //   return Container(
  //     height: 70,
  //     child: AspectRatio(
  //       aspectRatio: 1.0,
  //       child: TextField(
  //         autofocus: true,
  //         onChanged: (value) {
  //           if (value.length == 1 && last == false) {
  //             FocusScope.of(context).nextFocus();
  //           }
  //           if (value.length == 0 && first == false) {
  //             FocusScope.of(context).previousFocus();
  //           }
  //         },
  //         showCursor: false,
  //         readOnly: false,
  //         textAlign: TextAlign.center,
  //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //         keyboardType: TextInputType.number,
  //         maxLength: 1,
  //         decoration: InputDecoration(
  //           counter: Offstage(),
  //           enabledBorder: OutlineInputBorder(
  //               borderSide: BorderSide(width: 2, color: Colors.black12),
  //               borderRadius: BorderRadius.circular(12)),
  //           focusedBorder: OutlineInputBorder(
  //               borderSide: BorderSide(width: 2, color: Colors.purple),
  //               borderRadius: BorderRadius.circular(12)),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Email Auth sample'),
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          child: Center(
              child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _emailController,
                ),
                Card(
                  margin: EdgeInsets.only(top: 20),
                  elevation: 6,
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.green[400],
                    child: GestureDetector(
                      onTap: sendOtp,
                      child: Center(
                        child: Text(
                          "Request OTP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// A dynamically rendering text field
                (submitValid)
                    ? TextField(
                        controller: _otpController,
                      )
                    : Container(height: 1),
                (submitValid)
                    ? Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 50,
                        width: 200,
                        color: Colors.green[400],
                        child: GestureDetector(
                          onTap: sendOtp,
                          child: Center(
                            child: Text(
                              "Verify",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(height: 1)
              ],
            ),
          )),
        ),
      ),
    );
  }
}
