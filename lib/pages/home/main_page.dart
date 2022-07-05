import 'package:animalia_frontend/pages/home/halaman_beli_barang.dart';
import 'package:animalia_frontend/pages/home/halaman_profile.dart';
import 'package:animalia_frontend/pages/home/halaman_treatment.dart';
import 'package:animalia_frontend/pages/home/home_page.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customButtonNav() {
      return ClipRRect(
        child: BottomAppBar(
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor2,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                print(value);
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 25,
                    color: currentIndex == 0 ? primaryColor : Color(0xff2C3232),
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon_cart.png',
                    width: 30,
                    color: currentIndex == 1 ? primaryColor : Color(0xff2C3232),
                  ),
                ),
                label: 'Produk',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 25,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon_cut.png',
                    width: 25,
                    color: currentIndex == 2 ? primaryColor : Color(0xff2C3232),
                  ),
                ),
                label: 'Treatment',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 30,
                    color: currentIndex == 3 ? primaryColor : Color(0xff2C3232),
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return BuyProductPage();
          break;
        case 2:
          return MainPageTreatment();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor1,
      bottomNavigationBar: customButtonNav(),
      body: body(),
    );
  }
}
