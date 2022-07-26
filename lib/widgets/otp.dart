// import 'package:animalia_frontend/models/user_model.dart';
// import 'package:animalia_frontend/providers/auth_provider.dart';
// import 'package:email_auth/email_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class OtpPage extends StatefulWidget {
//   @override
//   State<OtpPage> createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> {
//   bool submitValid = false;
//   EmailAuth emailAuth;
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the package
//     emailAuth = new EmailAuth(
//       sessionName: "Sample session",
//     );

//     /// Configuring the remote server
//     emailAuth.config(remoteServerConfiguration);
//   }

//   /// a void function to verify if the Data provided is true
//   /// Convert it into a boolean function to match your needs.
//   void verify() {
//     print(emailAuth.validateOtp(
//         recipientMail: UserModel.email, userOtp: _otpcontroller.value.text));
//   }

//   /// a void funtion to send the OTP to the user
//   /// Can also be converted into a Boolean function and render accordingly for providers
//   void sendOtp() async {
//     bool result = await emailAuth.sendOtp(
//         recipientMail: _emailcontroller.value.text, otpLength: 5);
//     if (result) {
//       setState(() {
//         submitValid = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     AuthProvider authProvider = Provider.of(context);
//     UserModel user = authProvider.user;
//     final TextEditingController _otpController = TextEditingController();
//     void sendOtp() async {
//       authProvider.user.email;
//       var res = await EmailAuth.sendOtp(recipientMail: authProvider.user.email);
//       if (res) {
//         print("OTP Sent");
//       } else {
//         print("OTP belum terkirim");
//       }
//     }

//     return Container();
//   }
// }
