import 'package:flutter_app_st/data/database/database.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'rates_dao.g.dart';

@UseDao(tables: [Rates, Settings])
class RatesDao extends DatabaseAccessor<Database> with _$RatesDaoMixin {
  RatesDao(Database db) : super(db);

  // Future<List<RatesCompanion>> getRates(DateTime rateDate) {
  //   final query = select(rates)
  //       .join([innerJoin(settings, settings.numCode.equalsExp(rates.numCode))])
  //     ..orderBy([
  //       (OrderingTerm(expression: settings.position, mode: OrderingMode.asc))
  //     ]);
  //   return query
  //       .map((val) => RatesCompanion(
  //           numCode: val.rawData.read("rates.num_code"),
  //           charCode: val.rawData.read('rates.char_code'),
  //           scale: val.rawData.read('rates.scale'),
  //           name: val.rawData.read('rates.name'),
  //           currRate: val.rawData.read('rates.curr_rate'),
  //           dateRate: val.rawData.read('rates.date_rate')))
  //       .get();
  // }

  Future<List<Rate>> getRates(DateTime rateDate) => select(rates).get();

  addRates(List<RatesCompanion> rateList) async =>
      batch((batch) => batch.insertAllOnConflictUpdate(rates, rateList));
}
