// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:animalia_frontend/models/user_model.dart';
import 'package:animalia_frontend/providers/auth_provider.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/image_profile.png',
                    width: 64,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, ${user.nama}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        '@ aa',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: backgroundColor2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: primaryTextStyle.copyWith(
                    fontWeight: semibold, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem(
                  'Edit Profile',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/bayar');
                },
                child: menuItem(
                  'Changes Password',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Transaction',
                style: primaryTextStyle.copyWith(
                    fontWeight: semibold, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/histori-beli');
                },
                child: menuItem(
                  'Pembelian',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/histori-treatment');
                },
                child: menuItem(
                  'Sewa Jasa',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Log Out',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
        // ButtonLogOut(),
      ],
    );
  }
}
