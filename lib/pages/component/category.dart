import 'package:animalia_frontend/models/category_model.dart';
import 'package:animalia_frontend/providers/kategori_provider.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  // List<KategoriProvider> categories;
  List<String> categories = [
    "Semua barang",
    "Makanan Kucing",
    "A",
    "B",
    "C",
  ];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    KategoriProvider kat = Provider.of<KategoriProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
