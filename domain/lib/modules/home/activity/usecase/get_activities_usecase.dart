import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';
import '../entity/activity_entity.dart';
import '../repository/activity_repository.dart';

///
/// TMPS project
///
/// This is an example of Chain of responsibility
///
/// CTRL + Left click on [repository.getLocalActivityList] to see the continuation of the chain
///

class GetActivitiesUseCase {
  final ActivityRepository repository;

  GetActivitiesUseCase(this.repository);

  Stream<Either<Failure, List<ActivityEntity>>> call(int day) {
    return repository.getLocalActivityList(day);
  }
}
