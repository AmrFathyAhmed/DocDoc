import '../../../../../generated/assets.dart';
import 'payment_list_tile.dart';
import 'package:flutter/material.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(16.0),
      child: ListView(
        children: const [
          PaymentListTile(
            title: "PayPal",
            subtitle: "***** ***** ***** 37842",
            image: Assets.svgsPayPal,
          ),
          PaymentListTile(
            title: "Master Card",
            subtitle: "***** ***** ***** 42482",
            image: Assets.svgsMastercard,
          ),
          PaymentListTile(
            title: "Apple Pay",
            subtitle: "***** ***** ***** 37476",
            image: Assets.svgsApplepay,
          ),
          PaymentListTile(
            title: "Payonner",
            subtitle: "***** ***** ***** 57643",
            image: Assets.svgsPayoneer,
          ),
          PaymentListTile(
            title: "Dana",
            subtitle: "***** ***** ***** 10094",
            image: Assets.svgsDana,
          ),
        ],
      ),
    );
  }
}
