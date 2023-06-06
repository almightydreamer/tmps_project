import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/core/response.dart';
import 'package:either_dart/either.dart';
import '../repository/action_repository.dart';

class GetActionsUseCase {
  final ActionRepository repository;

  GetActionsUseCase(this.repository);

  Stream<Either<Failure, List<ActionEntity>>> call() {
    return repository.getLocalActionList();
  }
}
