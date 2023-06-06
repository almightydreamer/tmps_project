import 'dart:io';

import 'package:data/modules/home/dto/home_tables.dart';
import 'package:data/modules/home/mapper/action_mapper.dart';
import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/action/repository/action_repository.dart';
import 'package:domain/modules/core/response.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:domain/modules/home/activity/repository/activity_repository.dart';
import 'package:either_dart/either.dart';
import '../datasource/local_datasource.dart';
import '../mapper/activity_mapper.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  late LocalDataSource _localDataSource;

  ActivityRepositoryImpl({required LocalDataSource localDataSource}) {
    _localDataSource = localDataSource;
  }

  @override
  Stream<Either<Failure, List<ActivityEntity>>> getLocalActivityList(int day) async* {
    try {
      var activitiesStream = _localDataSource.retrieveActivities(day);
      await for (var activities in activitiesStream) {
        List<ActivityEntity> list = [];
        for (var activity in activities) {
          var action = await _localDataSource.getAction(activity.actionId);
          list.add(ActivityMapper().mapLocalToEntity(activity, action));
        }
        yield Right(list);
      }
    } catch (e, s) {
      yield Left(OtherFailure(e, s));
    }
  }

  @override
  Future<Either<Failure, ActivityEntity>> getLastActivity() async {
    try {
      var activity = await _localDataSource.getLastActivity();
      var action = await _localDataSource.getAction(activity.actionId);
      return Right(ActivityMapper().mapLocalToEntity(activity, action));
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }

  @override
  Future<Either<Failure, void>> saveLocalActivityList(List<ActivityEntity> list) async {
    try {
      print('repository saveActivity');
      var activities = list.map((e) => ActivityMapper().mapEntityToData(e)).toList();
      print('repository saveActivity${activities}');
      await _localDataSource.saveActivities(activities);
      print('repository saveActivity${activities}');
      return Right(null);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }
}
