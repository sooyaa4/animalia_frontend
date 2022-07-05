import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';

class TreatmentPage extends StatelessWidget {
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'History Treatment',
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
