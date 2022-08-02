import 'package:animalia_frontend/models/cart_model.dart';
import 'package:animalia_frontend/models/histori_barang.dart';
import 'package:animalia_frontend/pages/detiltransaksiproduk.dart';
import 'package:animalia_frontend/providers/auth_provider.dart';
import 'package:animalia_frontend/providers/cart_provider.dart';
import 'package:animalia_frontend/providers/histori_transaksi_barang.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoriBarangCard extends StatelessWidget {
  final HistoryBarangModel trans;
  HistoriBarangCard(this.trans);
  @override
  Widget build(BuildContext context) {
    HistoriBarangProvider historiBarangProvider =
        Provider.of<HistoriBarangProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTransaksiProdukPage(trans),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/animalia.png',
                      ),
                    ),
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
                        trans.id.toString(),
                        style: primaryTextStyle.copyWith(
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        NumberFormat.simpleCurrency(
                                name: 'Rp ', decimalDigits: 0)
                            .format(trans.total_harga),
                        style: primaryTextStyle,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      trans.status,
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
