import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';

class HalamanBayar extends StatelessWidget {
  CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Pembayaran',
          style: blackTextStyle,
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Silahkan melakukan pembayaran',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Pastikan nominal dan nomer tujuan benar',
                  style: primaryTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih metode pembayaran',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon_store_location.png',
                          width: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          'assets/icon_store_location.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tipe pembayaran',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          'BCA',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Nomer Rekening',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          '1020030115',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 196,
            height: 44,
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/checkout-success');
              },
              style: TextButton.styleFrom(
                backgroundColor: backgroundColor2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Bayar',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ],
      );
      // return Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset(
      //         'assets/icon_empty_cart.png',
      //         width: 80,
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Text(
      //         'Silahkan melakukan pembayaran',
      //         style: primaryTextStyle.copyWith(
      //           fontSize: 16,
      //           fontWeight: semibold,
      //         ),
      //       ),
      //       SizedBox(
      //         height: 12,
      //       ),
      //       Text(
      //         'Terimakasih sudah mempercayai pet shop animalia!',
      //         style: primaryTextStyle,
      //         textAlign: TextAlign.center,
      //       ),
      //       Container(
      //         width: 196,
      //         height: 44,
      //         margin: EdgeInsets.only(
      //           top: defaultMargin,
      //         ),
      //         child: TextButton(
      //           onPressed: () {
      //             Navigator.pushNamed(context, '/checkout-success');
      //           },
      //           style: TextButton.styleFrom(
      //             backgroundColor: primaryColor,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(12),
      //             ),
      //           ),
      //           child: Text(
      //             'Kembali ke home',
      //             style: primaryTextStyle.copyWith(
      //               fontSize: 16,
      //               fontWeight: medium,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: header(),
      body: content(),
    );
  }
}
