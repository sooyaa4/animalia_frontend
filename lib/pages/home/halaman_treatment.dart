import 'package:animalia_frontend/providers/treatment_provider.dart';
import 'package:animalia_frontend/widgets/treatment_card.dart';
import 'package:animalia_frontend/widgets/treatment_tile.dart';
import 'package:flutter/material.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:provider/provider.dart';

class MainPageTreatment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override
    TreatmentProvider treatmentProvider =
        Provider.of<TreatmentProvider>(context);
    print('jumlah treatment homepage: ${treatmentProvider.treatments.length}');
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
      );
    }

    Widget tabAtas() {
      return Container(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: defaultMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 230,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color: primaryColor,
                  ),
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
                          decoration: InputDecoration.collapsed(
                            hintText: 'Search',
                            hintStyle: primaryTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.search,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/cartt');
                      },
                      child: Image.asset(
                        'assets/Cart_icon_white.png',
                        width: 30,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/wishlist');
                      },
                      child: Image.asset(
                        'assets/icon_wishlist_white.png',
                        width: 60,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget treatmentCard() {
      // return Container(
      //   margin: EdgeInsets.only(top: 14),
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.horizontal,
      //     child: Row(
      //       children: [
      //         SizedBox(
      //           width: defaultMargin,
      //         ),
      //         Row(
      //           children: treatmentProvider.treatments
      //               .map(
      //                 (product) => TreatmentCard(product),
      //               )
      //               .toList(),
      //         ),
      //       ],
      //     ),
      //   ),
      // );
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: 5,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10,
              ),
              Column(
                children: treatmentProvider.treatments
                    .map(
                      (product) => TreatmentTile(product),
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
        tabAtas(),
        treatmentCard(),
      ],
    );
  }
}
