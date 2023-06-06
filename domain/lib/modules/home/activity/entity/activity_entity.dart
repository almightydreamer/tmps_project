import 'package:domain/modules/home/action/entity/action_entity.dart';

///
/// TMPS Project
///
/// This is an example of Factory Method
/// This is an example of Composite
///

class ActivityEntity extends ActionEntity {
  final int? id;
  final List<ActivityEntity> subActivities;
  final int day;
  final DateTime startOfActivity;
  final DateTime? endOfActivity;

  ActivityEntity({
    this.id,
    required this.day,
    required int actionId,
    required String actionName,
    this.subActivities = const [],
    this.endOfActivity,
    required this.startOfActivity,
  }) : super(actionId: actionId, actionName: actionName);

}
