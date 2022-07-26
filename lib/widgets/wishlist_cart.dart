// ignore_for_file: prefer_const_constructors

import 'package:animalia_frontend/models/product_barang_model.dart';
import 'package:animalia_frontend/providers/wishlist_provider.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  final ProductBarangModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishListProvider wishlistProvider = Provider.of<WishListProvider>(context);
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor1,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              // product.galleries[0].url,
              'assets/whiskas.jpg',
              width: 60,
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
                  product.nama_barang,
                  style: primaryTextStyle.copyWith(
                      fontWeight: semibold, fontSize: 15),
                ),
                Text(
                  '\Rp${product.harga}',
                  style: primaryTextStyle.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/icon_wishlist_white.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
