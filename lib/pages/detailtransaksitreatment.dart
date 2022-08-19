import 'package:animalia_frontend/models/histori_barang.dart';
import 'package:animalia_frontend/models/histori_treatment.dart';
import 'package:animalia_frontend/providers/histori_transaksi_barang.dart';
import 'package:animalia_frontend/providers/histori_transaksi_treatment.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DetailTransaksiTreatment extends StatefulWidget {
  final HistoriTreatmentModel treat;
  DetailTransaksiTreatment(this.treat);
  @override
  State<DetailTransaksiTreatment> createState() =>
      _DetailTransaksiTreatmentState();
}

class _DetailTransaksiTreatmentState extends State<DetailTransaksiTreatment> {
  @override
  Widget build(BuildContext context) {
    HistoriTreatmentProvider historiTreatmentProvider =
        Provider.of<HistoriTreatmentProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text('Detail Transaksi'),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Item',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                // Column(
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(top: 14),
                //       child: SingleChildScrollView(
                //         scrollDirection: Axis.horizontal,
                //         child: Row(
                //           children: [
                //             SizedBox(
                //               width: defaultMargin,
                //             ),
                //             Row(
                //               children: widget.trans.detailbarang
                //                   .map(
                //                     (tr) => DetailProductCard(tr),
                //                   )
                //                   .toList(),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // Column(
                //   children: widget.trans.detailbarang
                //       .map(
                //         (tr) => DetailProductCard(tr),
                //       )
                //       .toList(),
                // ),
              ],
            ),
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
                  'Alamat Pengiriman',
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
                        Image.asset(
                          'assets/icon_line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icon_your_address.png',
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
                          'Alamat Toko',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          'Keputih perintis 1 no 18',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Alamat pengiriman',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          widget.treat.alamat,
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
                  'Metode pembayaran',
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
                        Image.asset(
                          'assets/icon_line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icon_store_location.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/icon_line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icon_store_location.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
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
                          widget.treat.pembayaran[0].metodbayar.nama_metode,
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Status pembayaran',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          widget.treat.pembayaran[0].status,
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Tanggal pembayaran',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM yyyy')
                              .format(widget.treat.pembayaran[0].createdAt),
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
                  'Tanggal booking treatments',
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
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanggal',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM yyyy')
                              .format(widget.treat.tanggal_booking),
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
                  'Detail Pembayaran',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Harga Treatments',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                          .format(widget.treat.total_harga),
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tanggal Transaksi',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      DateFormat('d MMM yyyy')
                          .format(widget.treat.tanggal_pembelian),
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ongkos Jasa',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                          .format(30000),
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(fontWeight: semibold),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                          .format(widget.treat.subtotal),
                      style: priceTextStyle.copyWith(fontWeight: semibold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: header(),
      body: content(),
    );
  }
}
