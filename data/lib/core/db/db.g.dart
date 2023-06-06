// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $ActivityTable extends Activity
    with TableInfo<$ActivityTable, ActivityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dayIdMeta = const VerificationMeta('dayId');
  @override
  late final GeneratedColumn<int> dayId = GeneratedColumn<int>(
      'day_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _actionIdMeta =
      const VerificationMeta('actionId');
  @override
  late final GeneratedColumn<int> actionId = GeneratedColumn<int>(
      'action_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, dayId, actionId, startTime, endTime];
  @override
  String get aliasedName => _alias ?? 'activity';
  @override
  String get actualTableName => 'activity';
  @override
  VerificationContext validateIntegrity(Insertable<ActivityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('day_id')) {
      context.handle(
          _dayIdMeta, dayId.isAcceptableOrUnknown(data['day_id']!, _dayIdMeta));
    } else if (isInserting) {
      context.missing(_dayIdMeta);
    }
    if (data.containsKey('action_id')) {
      context.handle(_actionIdMeta,
          actionId.isAcceptableOrUnknown(data['action_id']!, _actionIdMeta));
    } else if (isInserting) {
      context.missing(_actionIdMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dayId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_id'])!,
      actionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}action_id'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
    );
  }

  @override
  $ActivityTable createAlias(String alias) {
    return $ActivityTable(attachedDatabase, alias);
  }
}

class ActivityData extends DataClass implements Insertable<ActivityData> {
  final int id;
  final int dayId;
  final int actionId;
  final DateTime startTime;
  final DateTime? endTime;
  const ActivityData(
      {required this.id,
      required this.dayId,
      required this.actionId,
      required this.startTime,
      this.endTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['day_id'] = Variable<int>(dayId);
    map['action_id'] = Variable<int>(actionId);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    return map;
  }

  ActivityCompanion toCompanion(bool nullToAbsent) {
    return ActivityCompanion(
      id: Value(id),
      dayId: Value(dayId),
      actionId: Value(actionId),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
    );
  }

  factory ActivityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityData(
      id: serializer.fromJson<int>(json['id']),
      dayId: serializer.fromJson<int>(json['dayId']),
      actionId: serializer.fromJson<int>(json['actionId']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dayId': serializer.toJson<int>(dayId),
      'actionId': serializer.toJson<int>(actionId),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
    };
  }

  ActivityData copyWith(
          {int? id,
          int? dayId,
          int? actionId,
          DateTime? startTime,
          Value<DateTime?> endTime = const Value.absent()}) =>
      ActivityData(
        id: id ?? this.id,
        dayId: dayId ?? this.dayId,
        actionId: actionId ?? this.actionId,
        startTime: startTime ?? this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
      );
  @override
  String toString() {
    return (StringBuffer('ActivityData(')
          ..write('id: $id, ')
          ..write('dayId: $dayId, ')
          ..write('actionId: $actionId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dayId, actionId, startTime, endTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityData &&
          other.id == this.id &&
          other.dayId == this.dayId &&
          other.actionId == this.actionId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime);
}

class ActivityCompanion extends UpdateCompanion<ActivityData> {
  final Value<int> id;
  final Value<int> dayId;
  final Value<int> actionId;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  const ActivityCompanion({
    this.id = const Value.absent(),
    this.dayId = const Value.absent(),
    this.actionId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
  });
  ActivityCompanion.insert({
    this.id = const Value.absent(),
    required int dayId,
    required int actionId,
    required DateTime startTime,
    this.endTime = const Value.absent(),
  })  : dayId = Value(dayId),
        actionId = Value(actionId),
        startTime = Value(startTime);
  static Insertable<ActivityData> custom({
    Expression<int>? id,
    Expression<int>? dayId,
    Expression<int>? actionId,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dayId != null) 'day_id': dayId,
      if (actionId != null) 'action_id': actionId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
    });
  }

  ActivityCompanion copyWith(
      {Value<int>? id,
      Value<int>? dayId,
      Value<int>? actionId,
      Value<DateTime>? startTime,
      Value<DateTime?>? endTime}) {
    return ActivityCompanion(
      id: id ?? this.id,
      dayId: dayId ?? this.dayId,
      actionId: actionId ?? this.actionId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dayId.present) {
      map['day_id'] = Variable<int>(dayId.value);
    }
    if (actionId.present) {
      map['action_id'] = Variable<int>(actionId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityCompanion(')
          ..write('id: $id, ')
          ..write('dayId: $dayId, ')
          ..write('actionId: $actionId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }
}

class $ActionTable extends Action with TableInfo<$ActionTable, ActionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'action';
  @override
  String get actualTableName => 'action';
  @override
  VerificationContext validateIntegrity(Insertable<ActionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $ActionTable createAlias(String alias) {
    return $ActionTable(attachedDatabase, alias);
  }
}

class ActionData extends DataClass implements Insertable<ActionData> {
  final int id;
  final String name;
  const ActionData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ActionCompanion toCompanion(bool nullToAbsent) {
    return ActionCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory ActionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  ActionData copyWith({int? id, String? name}) => ActionData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ActionData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionData && other.id == this.id && other.name == this.name);
}

class ActionCompanion extends UpdateCompanion<ActionData> {
  final Value<int> id;
  final Value<String> name;
  const ActionCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ActionCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<ActionData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ActionCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ActionCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $ActivityTable activity = $ActivityTable(this);
  late final $ActionTable action = $ActionTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [activity, action];
}
