import 'package:animalia_frontend/providers/wishlist_provider.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:animalia_frontend/widgets/wishlist_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishListProvider wishlistProvider = Provider.of<WishListProvider>(context);

    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Favorite product',
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_wishlist.png',
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
                style: primaryTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
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

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor2,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: wishlistProvider.wishlist
                .map(
                  (product) => WishlistCard(product),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content(),
      ],
    );
  }
}
