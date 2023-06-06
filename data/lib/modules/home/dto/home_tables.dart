import 'package:drift/drift.dart';

class Action extends Table {

  IntColumn get id => integer()();

  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Activity extends Table {

  IntColumn get id => integer()();

  IntColumn get dayId => integer()();

  IntColumn get actionId => integer()();

  DateTimeColumn get startTime => dateTime()();

  DateTimeColumn get endTime => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}