import 'package:animalia_frontend/models/treatment_model.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:animalia_frontend/providers/auth_provider.dart';
import 'package:animalia_frontend/providers/histori_transaksi_treatment.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:animalia_frontend/widgets/histori_treatment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoriTreatmentPage extends StatefulWidget {
  @override
  State<HistoriTreatmentPage> createState() => _HistoriTreatmentPageState();
}

class _HistoriTreatmentPageState extends State<HistoriTreatmentPage> {
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    HistoriTreatmentProvider historiTreatmentProvider =
        Provider.of<HistoriTreatmentProvider>(context);
    historiTreatmentProvider.getTransaksiTreatment(user);

    print(
        'jumlah histori di pembelian: ${historiTreatmentProvider.treatment.length}');

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
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: historiTreatmentProvider.treatment
            .map(
              (treats) => HistoriTreatmentCard(treats),
            )
            .toList(),
      );
    }

    Widget emptyHistory() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/animalia.png',
                width: 74,
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'You don\'t have dream product?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Let\'s find your favorite product',
                style: secondaryTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: header(),
      // body: historiProvider.transaksi.length == 0 ? emptyHistory() : content(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
