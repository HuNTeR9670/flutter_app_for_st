import 'package:flutter/material.dart';
import 'package:flutter_app_st/data/models/currency_rates_view.dart';

class RateItem extends StatelessWidget {
  final CurrencyRateView rate;

  const RateItem({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    children: [Text(rate.charCode)],
                  ),
                  Row(
                    children: [
                      Flexible(child: Text("${rate.scale} ${rate.name}"))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text(rate.rateNow), Text(rate.rateSecond)],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
