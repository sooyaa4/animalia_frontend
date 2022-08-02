// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:animalia_frontend/models/treatment_model.dart';
import 'package:animalia_frontend/pages/treatment_page.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TreatmentTile extends StatelessWidget {
  final TreatmentModel treatments;
  TreatmentTile(this.treatments);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TreatmentPage(treatments),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          right: defaultMargin,
          left: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:
                  // Image.network(
                  //   product.galleries[0].url,
                  //   width: 120,
                  //   height: 120,
                  //   fit: BoxFit.cover,
                  // ),
                  Image.asset(
                'assets/treatment.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                        .format(treatments.harga),
                    style: priceTextStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    treatments.nama_jasa,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    treatments.deskripsi,
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
