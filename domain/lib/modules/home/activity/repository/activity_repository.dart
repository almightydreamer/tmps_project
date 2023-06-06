import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';

import '../entity/activity_entity.dart';

abstract class ActivityRepository {
  Stream<Either<Failure, List<ActivityEntity>>> getLocalActivityList(int day);
  Future<Either<Failure, void>> saveLocalActivityList(List<ActivityEntity> list);
  Future<Either<Failure, ActivityEntity>> getLastActivity();
}