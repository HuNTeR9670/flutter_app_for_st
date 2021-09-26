import 'dart:io';
import 'package:flutter_app_st/data/database/daos/currencies_dao.dart';
import 'package:flutter_app_st/data/database/daos/rates_dao.dart';
import 'package:flutter_app_st/data/database/daos/settings_dao.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/ffi.dart';

part 'database.g.dart';

class Currencies extends Table {
  @override
  Set<Column> get primaryKey => {numCode};
  TextColumn get numCode => text()();
  TextColumn get charCode => text()();
  TextColumn get scale => text()();
  TextColumn get name => text()();
}

class Rates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get numCode => text()();
  TextColumn get currRate => text()();
  DateTimeColumn get dateRate => dateTime()();
}

class Settings extends Table {
  @override
  Set<Column> get primaryKey => {numCode};
  TextColumn get numCode => text()();
  IntColumn get position => integer().nullable()();
  BoolColumn get enable => boolean().nullable()();
}

@UseMoor(tables: [
  Rates,
  Settings,
  Currencies
], daos: [
  RatesDao,
  SettingsDao,
  CurrenciesDao
])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}