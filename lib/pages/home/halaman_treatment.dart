import 'package:animalia_frontend/providers/treatment_provider.dart';
import 'package:animalia_frontend/widgets/treatment_card.dart';
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

    Widget treatmentCard() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: treatmentProvider.treatments
                    .map(
                      (product) => TreatmentCard(product),
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
        treatmentCard(),
      ],
    );
  }
}
