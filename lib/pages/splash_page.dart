import 'package:animalia_frontend/providers/product_barang_provider.dart';
import 'package:animalia_frontend/providers/treatment_provider.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductBarangProvider>(context, listen: false)
        .getProducts();
    await Provider.of<TreatmentProvider>(context, listen: false).getTreatment();
    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 550,
          height: 340,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/animalia11.png'))),
        ),
      ),
    );
  }
}
