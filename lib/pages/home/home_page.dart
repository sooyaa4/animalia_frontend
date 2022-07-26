import 'package:animalia_frontend/models/pelanggan_model.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:animalia_frontend/providers/auth_provider.dart';
import 'package:animalia_frontend/providers/product_barang_provider.dart';
import 'package:animalia_frontend/providers/treatment_provider.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:animalia_frontend/widgets/product_card.dart';
import 'package:animalia_frontend/widgets/treatment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductBarangProvider productBarangProvider =
        Provider.of<ProductBarangProvider>(context);
    TreatmentProvider treatmentProvider =
        Provider.of<TreatmentProvider>(context);

    // print('jumlah produk homepage: ${productBarangProvider.products.length}');
    // print('jumlah treatment homepage: ${treatmentProvider.treatments.length}');

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Animalia',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // image: AssetImage(
                  //   'assets/image_profile.png',
                  // ),
                  image: NetworkImage(
                      'https://ui-avatars.com/api/${{user.email}}'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget popularProductTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Produk',
          style: primaryTextStyle.copyWith(
            fontSize: 27,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget popularProduct() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: productBarangProvider.products
                    .map(
                      (product) => ProductCard(product),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget treatmentTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Treatments',
          style: primaryTextStyle.copyWith(
            fontSize: 27,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget treatmentCard() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: treatmentProvider.treatments
                    .map(
                      (product) => TreatmentCard(product),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        // categories(),
        popularProductTitle(),
        popularProduct(),
        treatmentTitle(),
        treatmentCard(),
      ],
    );
  }
}
