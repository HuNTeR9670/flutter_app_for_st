import 'package:flutter_app_st/data/database/database.dart';
import 'package:flutter_app_st/data/models/currencies_query.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'currencies_dao.g.dart';

@UseDao(tables: [Rates, Settings, Currencies])
class CurrenciesDao extends DatabaseAccessor<Database>
    with _$CurrenciesDaoMixin {
  CurrenciesDao(Database db) : super(db);

  Future<List<CurrenciesQuery>> getCurrencies(DateTime rateDate) {
    final query = select(currencies).join(
      [
        innerJoin(settings, settings.numCode.equalsExp(currencies.numCode)),
        innerJoin(rates, rates.numCode.equalsExp(currencies.numCode))
      ],
    )
      ..where(rates.dateRate.equals(rateDate))
      ..where(settings.enable.equals(true))
      ..orderBy([
        (OrderingTerm(expression: settings.position, mode: OrderingMode.asc))
      ]);
    return query
        .map((val) => CurrenciesQuery(
            numCode: val.rawData.read("currencies.num_code"),
            charCode: val.rawData.read('currencies.char_code'),
            scale: val.rawData.read('currencies.scale'),
            name: val.rawData.read('currencies.name'),
            rate: val.rawData.read('rates.curr_rate')))
        .get();
  }

  addCurrencies(List<CurrenciesCompanion> currenciesList) async => batch(
      (batch) => batch.insertAllOnConflictUpdate(currencies, currenciesList));
}
