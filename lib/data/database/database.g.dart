// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Rate extends DataClass implements Insertable<Rate> {
  final int id;
  final String numCode;
  final String currRate;
  final DateTime dateRate;
  Rate(
      {required this.id,
      required this.numCode,
      required this.currRate,
      required this.dateRate});
  factory Rate.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Rate(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      numCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}num_code'])!,
      currRate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}curr_rate'])!,
      dateRate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_rate'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['num_code'] = Variable<String>(numCode);
    map['curr_rate'] = Variable<String>(currRate);
    map['date_rate'] = Variable<DateTime>(dateRate);
    return map;
  }

  RatesCompanion toCompanion(bool nullToAbsent) {
    return RatesCompanion(
      id: Value(id),
      numCode: Value(numCode),
      currRate: Value(currRate),
      dateRate: Value(dateRate),
    );
  }

  factory Rate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Rate(
      id: serializer.fromJson<int>(json['id']),
      numCode: serializer.fromJson<String>(json['numCode']),
      currRate: serializer.fromJson<String>(json['currRate']),
      dateRate: serializer.fromJson<DateTime>(json['dateRate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'numCode': serializer.toJson<String>(numCode),
      'currRate': serializer.toJson<String>(currRate),
      'dateRate': serializer.toJson<DateTime>(dateRate),
    };
  }

  Rate copyWith(
          {int? id, String? numCode, String? currRate, DateTime? dateRate}) =>
      Rate(
        id: id ?? this.id,
        numCode: numCode ?? this.numCode,
        currRate: currRate ?? this.currRate,
        dateRate: dateRate ?? this.dateRate,
      );
  @override
  String toString() {
    return (StringBuffer('Rate(')
          ..write('id: $id, ')
          ..write('numCode: $numCode, ')
          ..write('currRate: $currRate, ')
          ..write('dateRate: $dateRate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(numCode.hashCode, $mrjc(currRate.hashCode, dateRate.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rate &&
          other.id == this.id &&
          other.numCode == this.numCode &&
          other.currRate == this.currRate &&
          other.dateRate == this.dateRate);
}

class RatesCompanion extends UpdateCompanion<Rate> {
  final Value<int> id;
  final Value<String> numCode;
  final Value<String> currRate;
  final Value<DateTime> dateRate;
  const RatesCompanion({
    this.id = const Value.absent(),
    this.numCode = const Value.absent(),
    this.currRate = const Value.absent(),
    this.dateRate = const Value.absent(),
  });
  RatesCompanion.insert({
    this.id = const Value.absent(),
    required String numCode,
    required String currRate,
    required DateTime dateRate,
  })  : numCode = Value(numCode),
        currRate = Value(currRate),
        dateRate = Value(dateRate);
  static Insertable<Rate> custom({
    Expression<int>? id,
    Expression<String>? numCode,
    Expression<String>? currRate,
    Expression<DateTime>? dateRate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numCode != null) 'num_code': numCode,
      if (currRate != null) 'curr_rate': currRate,
      if (dateRate != null) 'date_rate': dateRate,
    });
  }

  RatesCompanion copyWith(
      {Value<int>? id,
      Value<String>? numCode,
      Value<String>? currRate,
      Value<DateTime>? dateRate}) {
    return RatesCompanion(
      id: id ?? this.id,
      numCode: numCode ?? this.numCode,
      currRate: currRate ?? this.currRate,
      dateRate: dateRate ?? this.dateRate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (numCode.present) {
      map['num_code'] = Variable<String>(numCode.value);
    }
    if (currRate.present) {
      map['curr_rate'] = Variable<String>(currRate.value);
    }
    if (dateRate.present) {
      map['date_rate'] = Variable<DateTime>(dateRate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RatesCompanion(')
          ..write('id: $id, ')
          ..write('numCode: $numCode, ')
          ..write('currRate: $currRate, ')
          ..write('dateRate: $dateRate')
          ..write(')'))
        .toString();
  }
}

class $RatesTable extends Rates with TableInfo<$RatesTable, Rate> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RatesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _numCodeMeta = const VerificationMeta('numCode');
  late final GeneratedColumn<String?> numCode = GeneratedColumn<String?>(
      'num_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _currRateMeta = const VerificationMeta('currRate');
  late final GeneratedColumn<String?> currRate = GeneratedColumn<String?>(
      'curr_rate', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dateRateMeta = const VerificationMeta('dateRate');
  late final GeneratedColumn<DateTime?> dateRate = GeneratedColumn<DateTime?>(
      'date_rate', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, numCode, currRate, dateRate];
  @override
  String get aliasedName => _alias ?? 'rates';
  @override
  String get actualTableName => 'rates';
  @override
  VerificationContext validateIntegrity(Insertable<Rate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('num_code')) {
      context.handle(_numCodeMeta,
          numCode.isAcceptableOrUnknown(data['num_code']!, _numCodeMeta));
    } else if (isInserting) {
      context.missing(_numCodeMeta);
    }
    if (data.containsKey('curr_rate')) {
      context.handle(_currRateMeta,
          currRate.isAcceptableOrUnknown(data['curr_rate']!, _currRateMeta));
    } else if (isInserting) {
      context.missing(_currRateMeta);
    }
    if (data.containsKey('date_rate')) {
      context.handle(_dateRateMeta,
          dateRate.isAcceptableOrUnknown(data['date_rate']!, _dateRateMeta));
    } else if (isInserting) {
      context.missing(_dateRateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Rate map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Rate.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RatesTable createAlias(String alias) {
    return $RatesTable(_db, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final String numCode;
  final int? position;
  final bool? enable;
  Setting({required this.numCode, this.position, this.enable});
  factory Setting.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Setting(
      numCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}num_code'])!,
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position']),
      enable: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}enable']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['num_code'] = Variable<String>(numCode);
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<int?>(position);
    }
    if (!nullToAbsent || enable != null) {
      map['enable'] = Variable<bool?>(enable);
    }
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      numCode: Value(numCode),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      enable:
          enable == null && nullToAbsent ? const Value.absent() : Value(enable),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Setting(
      numCode: serializer.fromJson<String>(json['numCode']),
      position: serializer.fromJson<int?>(json['position']),
      enable: serializer.fromJson<bool?>(json['enable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'numCode': serializer.toJson<String>(numCode),
      'position': serializer.toJson<int?>(position),
      'enable': serializer.toJson<bool?>(enable),
    };
  }

  Setting copyWith({String? numCode, int? position, bool? enable}) => Setting(
        numCode: numCode ?? this.numCode,
        position: position ?? this.position,
        enable: enable ?? this.enable,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('numCode: $numCode, ')
          ..write('position: $position, ')
          ..write('enable: $enable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(numCode.hashCode, $mrjc(position.hashCode, enable.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.numCode == this.numCode &&
          other.position == this.position &&
          other.enable == this.enable);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> numCode;
  final Value<int?> position;
  final Value<bool?> enable;
  const SettingsCompanion({
    this.numCode = const Value.absent(),
    this.position = const Value.absent(),
    this.enable = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String numCode,
    this.position = const Value.absent(),
    this.enable = const Value.absent(),
  }) : numCode = Value(numCode);
  static Insertable<Setting> custom({
    Expression<String>? numCode,
    Expression<int?>? position,
    Expression<bool?>? enable,
  }) {
    return RawValuesInsertable({
      if (numCode != null) 'num_code': numCode,
      if (position != null) 'position': position,
      if (enable != null) 'enable': enable,
    });
  }

  SettingsCompanion copyWith(
      {Value<String>? numCode, Value<int?>? position, Value<bool?>? enable}) {
    return SettingsCompanion(
      numCode: numCode ?? this.numCode,
      position: position ?? this.position,
      enable: enable ?? this.enable,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (numCode.present) {
      map['num_code'] = Variable<String>(numCode.value);
    }
    if (position.present) {
      map['position'] = Variable<int?>(position.value);
    }
    if (enable.present) {
      map['enable'] = Variable<bool?>(enable.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('numCode: $numCode, ')
          ..write('position: $position, ')
          ..write('enable: $enable')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SettingsTable(this._db, [this._alias]);
  final VerificationMeta _numCodeMeta = const VerificationMeta('numCode');
  late final GeneratedColumn<String?> numCode = GeneratedColumn<String?>(
      'num_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _enableMeta = const VerificationMeta('enable');
  late final GeneratedColumn<bool?> enable = GeneratedColumn<bool?>(
      'enable', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (enable IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [numCode, position, enable];
  @override
  String get aliasedName => _alias ?? 'settings';
  @override
  String get actualTableName => 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('num_code')) {
      context.handle(_numCodeMeta,
          numCode.isAcceptableOrUnknown(data['num_code']!, _numCodeMeta));
    } else if (isInserting) {
      context.missing(_numCodeMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    }
    if (data.containsKey('enable')) {
      context.handle(_enableMeta,
          enable.isAcceptableOrUnknown(data['enable']!, _enableMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {numCode};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Setting.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(_db, alias);
  }
}

class Currencie extends DataClass implements Insertable<Currencie> {
  final String numCode;
  final String charCode;
  final String scale;
  final String name;
  Currencie(
      {required this.numCode,
      required this.charCode,
      required this.scale,
      required this.name});
  factory Currencie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Currencie(
      numCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}num_code'])!,
      charCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}char_code'])!,
      scale: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}scale'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['num_code'] = Variable<String>(numCode);
    map['char_code'] = Variable<String>(charCode);
    map['scale'] = Variable<String>(scale);
    map['name'] = Variable<String>(name);
    return map;
  }

  CurrenciesCompanion toCompanion(bool nullToAbsent) {
    return CurrenciesCompanion(
      numCode: Value(numCode),
      charCode: Value(charCode),
      scale: Value(scale),
      name: Value(name),
    );
  }

  factory Currencie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Currencie(
      numCode: serializer.fromJson<String>(json['numCode']),
      charCode: serializer.fromJson<String>(json['charCode']),
      scale: serializer.fromJson<String>(json['scale']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'numCode': serializer.toJson<String>(numCode),
      'charCode': serializer.toJson<String>(charCode),
      'scale': serializer.toJson<String>(scale),
      'name': serializer.toJson<String>(name),
    };
  }

  Currencie copyWith(
          {String? numCode, String? charCode, String? scale, String? name}) =>
      Currencie(
        numCode: numCode ?? this.numCode,
        charCode: charCode ?? this.charCode,
        scale: scale ?? this.scale,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Currencie(')
          ..write('numCode: $numCode, ')
          ..write('charCode: $charCode, ')
          ..write('scale: $scale, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(numCode.hashCode,
      $mrjc(charCode.hashCode, $mrjc(scale.hashCode, name.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Currencie &&
          other.numCode == this.numCode &&
          other.charCode == this.charCode &&
          other.scale == this.scale &&
          other.name == this.name);
}

class CurrenciesCompanion extends UpdateCompanion<Currencie> {
  final Value<String> numCode;
  final Value<String> charCode;
  final Value<String> scale;
  final Value<String> name;
  const CurrenciesCompanion({
    this.numCode = const Value.absent(),
    this.charCode = const Value.absent(),
    this.scale = const Value.absent(),
    this.name = const Value.absent(),
  });
  CurrenciesCompanion.insert({
    required String numCode,
    required String charCode,
    required String scale,
    required String name,
  })  : numCode = Value(numCode),
        charCode = Value(charCode),
        scale = Value(scale),
        name = Value(name);
  static Insertable<Currencie> custom({
    Expression<String>? numCode,
    Expression<String>? charCode,
    Expression<String>? scale,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (numCode != null) 'num_code': numCode,
      if (charCode != null) 'char_code': charCode,
      if (scale != null) 'scale': scale,
      if (name != null) 'name': name,
    });
  }

  CurrenciesCompanion copyWith(
      {Value<String>? numCode,
      Value<String>? charCode,
      Value<String>? scale,
      Value<String>? name}) {
    return CurrenciesCompanion(
      numCode: numCode ?? this.numCode,
      charCode: charCode ?? this.charCode,
      scale: scale ?? this.scale,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (numCode.present) {
      map['num_code'] = Variable<String>(numCode.value);
    }
    if (charCode.present) {
      map['char_code'] = Variable<String>(charCode.value);
    }
    if (scale.present) {
      map['scale'] = Variable<String>(scale.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrenciesCompanion(')
          ..write('numCode: $numCode, ')
          ..write('charCode: $charCode, ')
          ..write('scale: $scale, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CurrenciesTable extends Currencies
    with TableInfo<$CurrenciesTable, Currencie> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CurrenciesTable(this._db, [this._alias]);
  final VerificationMeta _numCodeMeta = const VerificationMeta('numCode');
  late final GeneratedColumn<String?> numCode = GeneratedColumn<String?>(
      'num_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _charCodeMeta = const VerificationMeta('charCode');
  late final GeneratedColumn<String?> charCode = GeneratedColumn<String?>(
      'char_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _scaleMeta = const VerificationMeta('scale');
  late final GeneratedColumn<String?> scale = GeneratedColumn<String?>(
      'scale', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [numCode, charCode, scale, name];
  @override
  String get aliasedName => _alias ?? 'currencies';
  @override
  String get actualTableName => 'currencies';
  @override
  VerificationContext validateIntegrity(Insertable<Currencie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('num_code')) {
      context.handle(_numCodeMeta,
          numCode.isAcceptableOrUnknown(data['num_code']!, _numCodeMeta));
    } else if (isInserting) {
      context.missing(_numCodeMeta);
    }
    if (data.containsKey('char_code')) {
      context.handle(_charCodeMeta,
          charCode.isAcceptableOrUnknown(data['char_code']!, _charCodeMeta));
    } else if (isInserting) {
      context.missing(_charCodeMeta);
    }
    if (data.containsKey('scale')) {
      context.handle(
          _scaleMeta, scale.isAcceptableOrUnknown(data['scale']!, _scaleMeta));
    } else if (isInserting) {
      context.missing(_scaleMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {numCode};
  @override
  Currencie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Currencie.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CurrenciesTable createAlias(String alias) {
    return $CurrenciesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $RatesTable rates = $RatesTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $CurrenciesTable currencies = $CurrenciesTable(this);
  late final RatesDao ratesDao = RatesDao(this as Database);
  late final SettingsDao settingsDao = SettingsDao(this as Database);
  late final CurrenciesDao currenciesDao = CurrenciesDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [rates, settings, currencies];
}
