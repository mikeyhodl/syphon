import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:syphon/store/media/encryption.dart';
import 'package:syphon/store/media/model.dart';

class EncryptInfoToJsonConverter extends NullAwareTypeConverter<EncryptInfo?, String> {
  const EncryptInfoToJsonConverter();

  @override
  EncryptInfo? mapToDart(String? fromDb) {
    return EncryptInfo.fromJson(json.decode(fromDb ?? '{}') ?? {});
  }

  @override
  String? mapToSql(EncryptInfo? value) {
    return json.encode(value);
  }

  @override
  EncryptInfo? requireFromSql(String fromDb) {
    // TODO: implement requireFromSql
    throw UnimplementedError();
  }

  @override
  String requireToSql(EncryptInfo? value) {
    // TODO: implement requireToSql
    throw UnimplementedError();
  }
}

///
/// Messages Model (Table)
///
/// Meant to store messages in _cold storage_
///
@UseRowClass(Media)
class Medias extends Table {
  TextColumn get mxcUri => text().customConstraint('UNIQUE')();
  BlobColumn get data => blob().nullable()();
  TextColumn get type => text().nullable()();
  TextColumn get info => text().map(const EncryptInfoToJsonConverter()).nullable()();

  @override
  Set<Column> get primaryKey => {mxcUri};
}
