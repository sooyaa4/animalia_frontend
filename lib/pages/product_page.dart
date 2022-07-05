import 'package:animalia_frontend/models/product_barang_model.dart';
import 'package:animalia_frontend/providers/cart_provider.dart';
import 'package:animalia_frontend/providers/wishlist_provider.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final ProductBarangModel product;
  ProductPage(this.product);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    WishListProvider wishlistProvider = Provider.of<WishListProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Future<void> showSuccesDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                        fontSize: 18, fontWeight: semibold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'items added succesfully',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'View my cart',
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
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffc4c4c4),
        ),
      );
    }

    Widget familiarShoesCart(String imageurl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageurl),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                ),
              ],
            ),
          ),
          // CarouselSlider(
          //   items: widget.product.galleries
          //       .map(
          //         (image) => Image.network(
          //           image.url,
          //           width: MediaQuery.of(context).size.width,
          //           height: 310,
          //           fit: BoxFit.cover,
          //         ),
          //       )
          //       .toList(),
          //   options: CarouselOptions(
          //       initialPage: 0,
          //       onPageChanged: (index, reason) {
          //         setState(() {
          //           currentIndex = index;
          //         });
          //       }),
          // ),
          SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: widget.product.galleries.map((e) {
          //     index++;
          //     return indicator(index);
          //   }).toList(),
          // ),
        ],
      );
    }

    Widget content() {
      int index = -1;
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 17,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
          color: backgroundColor2,
        ),
        child: Column(
          children: [
            Container(
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
                          widget.product.nama_barang,
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          widget.product.katbarang.nama_kategori,
                          style: secondaryTextStyle.copyWith(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setProduct(widget.product);

                      if (wishlistProvider.isWishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              'Has been added to the wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              'Has been removed from the wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      wishlistProvider.isWishlist(widget.product)
                          ? 'assets/icon_wishlist_white.png'
                          : 'assets/icon_wishlist.png',
                      width: 46,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\Rp${widget.product.harga}',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semibold),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    widget.product.deskripsi_barang,
                    style: primaryTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    child: Text(
                      'Familiar product',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: familiarShoes.map((image) {
                  //       index++;
                  //       return Container(
                  //           margin: EdgeInsets.only(
                  //               left: index == 0 ? defaultMargin : 0),
                  //           child: familiarShoesCart(image));
                  //     }).toList(),
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, '/detail-chat');
                  //   },
                  //   child: Container(
                  //     width: 54,
                  //     height: 54,
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: AssetImage('assets/button_chat.png'),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          cartProvider.addCart(widget.product);
                          showSuccesDialog();
                        },
                        style: TextButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor,
                        ),
                        child: Text(
                          'Add to cart',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
