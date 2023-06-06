import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';

import '../entity/action_entity.dart';

abstract class ActionRepository {
  Stream<Either<Failure, List<ActionEntity>>> getLocalActionList();

  Future<Either<Failure, ActionEntity>> getLocalAction(int actionId);

  Future<Either<Failure, void>> saveLocalActionList(List<ActionEntity> list);
}
