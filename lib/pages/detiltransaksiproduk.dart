import 'package:animalia_frontend/models/histori_barang.dart';
import 'package:animalia_frontend/providers/histori_transaksi_barang.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:animalia_frontend/widgets/detailproduk_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';

class DetailTransaksiProdukPage extends StatefulWidget {
  final HistoryBarangModel trans;
  DetailTransaksiProdukPage(this.trans);
  @override
  State<DetailTransaksiProdukPage> createState() =>
      _DetailTransaksiProdukPageState();
}

class _DetailTransaksiProdukPageState extends State<DetailTransaksiProdukPage> {
  @override
  Widget build(BuildContext context) {
    HistoriBarangProvider historiBarangProvider =
        Provider.of<HistoriBarangProvider>(context);
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
                          widget.trans.alamat,
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
                          widget.trans.pembayaran[0].metodbayar.nama_metode,
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
                          widget.trans.pembayaran[0].status,
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
                          DateFormat('dd MMM yyyy')
                              .format(widget.trans.pembayaran[0].createdAt),
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
                  'Pemilihan kurir',
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
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pilihan Kurir',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          widget
                              .trans.pengiriman[0].metodkirim.nama_jenis_kirim,
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Nomer Resi ',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          widget.trans.pengiriman[0].noresi,
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Status Pengiriman ',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          widget.trans.pengiriman[0].status,
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tanggal Pengiriman ',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM yyyy')
                              .format(widget.trans.pengiriman[0].tanggalKirim),
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
                      'Total Harga Barang',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                          .format(widget.trans.total_harga),
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
                      DateFormat('dd MMM yyyy')
                          .format(widget.trans.tanggal_pembelian),
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
                      'Ongkos Kirim',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                          .format(widget.trans.pengiriman[0].metodkirim.ongkir),
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
                          .format(widget.trans.subtotal),
                      style: priceTextStyle.copyWith(fontWeight: semibold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Divider(
            thickness: 1,
            color: Color(0xff2E3141),
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: defaultMargin,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: backgroundColor2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Selesai',
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 16,
                ),
              ),
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
