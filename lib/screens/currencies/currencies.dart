import 'package:flutter/material.dart';
import 'package:flutter_app_st/common/rate_item.dart';
import 'package:flutter_app_st/data/models/currencies_query.dart';
import 'package:flutter_app_st/data/models/currency_rates_view.dart';
import 'package:flutter_app_st/di/service_locator.dart';
import 'package:flutter_app_st/screens/currencies/currencies_vew_model.dart';
import 'package:flutter_app_st/screens/settings/settings.dart';
import 'package:intl/intl.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  Widget _buildListView(
    BuildContext context,
    AsyncSnapshot<CurrencyRatesView> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.done) {
      return Scaffold(
        appBar: AppBar(title: const Text('Курсы валют'), actions: [
          snapshot.hasError
              ? const Padding(padding: EdgeInsets.zero)
              : Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SettingsScreen();
                      }));
                    },
                    child: const Icon(
                      Icons.settings, // add custom icons also
                    ),
                  ),
                ),
        ]),
        body: Center(
          child: snapshot.hasError
              ? const Text('Не удалось получить курсы валют')
              : Column(
                  children: [
                    Container(
                      height: 40.0,
                      color: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              DateFormat("dd.MM.yy")
                                  .format(snapshot.data!.nowDate),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 22.0),
                            child: Text(
                              DateFormat("dd.MM.yy")
                                  .format(snapshot.data!.secondDate),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.currRates.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RateItem(
                              rate: snapshot.data!.currRates[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ),
                    )
                  ],
                ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CurrencyRatesView>(
      future: serviceLocator.get<CurrenciesViewModel>().getRates(),
      builder: (context, AsyncSnapshot<CurrencyRatesView> snapshot) {
        return _buildListView(context, snapshot);
      },
    );
  }
}
