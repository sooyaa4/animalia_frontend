import 'package:animalia_frontend/providers/auth_provider.dart';
import 'package:animalia_frontend/providers/cart_provider.dart';
import 'package:animalia_frontend/providers/jeniskirim_provider.dart';
import 'package:animalia_frontend/providers/metode_bayar_provider.dart';
import 'package:animalia_frontend/providers/transaksi_barang_provider.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:animalia_frontend/widgets/checkout_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController alamatController = TextEditingController(text: '');
  String kurir;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransaksiBarangprovider transaksiBarangprovider =
        Provider.of<TransaksiBarangprovider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    MetodeBayarProvider metodeBayarProvider =
        Provider.of<MetodeBayarProvider>(context);
    JenisKirimProvider jenisKirimProvider =
        Provider.of<JenisKirimProvider>(context);
    handleCheckout() async {
      if (await transaksiBarangprovider.checkout(
        authProvider.user.token,
        cartProvider.carts,
        cartProvider.totalPrice(),
        cartProvider.subTotal(),
        cartProvider.tanggalPembelian(),
        cartProvider.alamat = alamatController.text,
        // cartProvider.kurir = kurir,
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/halaman-bayar', (route) => false);
      }
    }

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Detail',
          style: primaryTextStyle,
        ),
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
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => CheckoutCard(cart),
                      )
                      .toList(),
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
                          height: 10,
                        ),
                        Text(
                          'Alamat pengiriman',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 45,
                                width: 230,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: backgroundColor2,
                                  borderRadius: BorderRadius.circular(12),
                                  // border: Border.all(
                                  //   color: primaryColor,
                                  // ),
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          style: primaryTextStyle,
                                          controller: alamatController,
                                          decoration: InputDecoration.collapsed(
                                            hintText: 'Alamat anda',
                                            hintStyle: primaryTextStyle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                      ],
                    ),
                    SizedBox(
                      width: 12,
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
                          'BCA',
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
                          'JNE',
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
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 17, vertical: 1),
          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(color: Color(0XFFF2F2F2), width: 2),
          //     boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 1)],
          //   ),
          //   child: DropdownButtonHideUnderline(
          //     child: DropdownButton(
          //       iconSize: 36,
          //       icon: Icon(
          //         Icons.arrow_drop_down,
          //         color: Color(0xff13A89E),
          //       ),
          //       isExpanded: true,
          //       value: jenisKirimProvider.kirim,
          //       onChanged: (value) {
          //         setState(() {
          //           jenisKirimProvider.kirims = value;
          //         });
          //       },
          //       items: jenisKirimProvider.kirim.map((kirim) {
          //         return DropdownMenuItem(
          //           child: Text(kirim.id.toString()),
          //           value: kirim,
          //         );
          //       }).toList(),
          //       hint: Padding(
          //         padding: const EdgeInsets.all(10.0),
          //         child: Text('Pilihan Kurir'),
          //       ),
          //     ),
          //   ),
          // ),
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
                  'Payment Sumary ',
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
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      '${cartProvider.totalItems()} items',
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
                      'Product Price',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                          .format(cartProvider.totalPrice()),
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
                      'Biaya Ongkir',
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      'Rp 10.000',
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
                          .format(cartProvider.subTotal()),
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
              onPressed: handleCheckout,
              style: TextButton.styleFrom(
                backgroundColor: backgroundColor2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Checkout Now',
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
