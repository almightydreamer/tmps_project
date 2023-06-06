import 'dart:io';

import 'package:data/modules/home/dto/home_tables.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

@DriftDatabase(
  tables:[Activity, Action]
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

 @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'database.sqlite'));
    return NativeDatabase(file);
  });
}
