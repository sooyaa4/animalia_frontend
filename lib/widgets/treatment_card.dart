import 'package:animalia_frontend/models/treatment_model.dart';
import 'package:animalia_frontend/pages/treatment_page.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';

class TreatmentCard extends StatelessWidget {
  final TreatmentModel treatments;
  TreatmentCard(this.treatments);
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
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            // Image.network(
            //   product.galleries[0].url,
            //   width: 225,
            //   height: 150,
            //   fit: BoxFit.cover,
            // ),
            Image.asset(
              'assets/treatment.png',
              width: 225,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    treatments.nama_jasa,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    treatments.deskripsi,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: semibold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    '\Rp${treatments.harga}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
