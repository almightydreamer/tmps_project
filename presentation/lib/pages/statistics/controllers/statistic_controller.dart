import 'dart:async';
import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/action/usecase/get_actions_usecase.dart';
import 'package:domain/modules/home/action/usecase/save_actions_usecase.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:domain/modules/home/activity/usecase/get_activities_usecase.dart';
import 'package:domain/modules/home/activity/usecase/resume_activity_usecase.dart';
import 'package:domain/modules/home/activity/usecase/save_activity_usecase.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class StatisticController extends GetxController {
  RxMap<String, int> activities = RxMap();

  final _getActivitiesUseCase = GetIt.instance.get<GetActivitiesUseCase>();

  List<String> dayStringList = ['Today', 'Yesterday', 'Two days ago'];
  RxString dropdownValue = ''.obs;

  Future<void> getActivities(int day) async {
    print('getActions');
    activities.clear();
    var response = _getActivitiesUseCase.call(day);
    response.listen((event) {
      event.fold((l) => null, (r) {
        r.forEach((element) {
          if (element.endOfActivity == null) {
            return;
          }
          activities.update(element.actionName!,
              (value) => value + element.endOfActivity!.difference(element.startOfActivity).inSeconds,
              ifAbsent: () => element.endOfActivity!.difference(element.startOfActivity).inSeconds);
        });
      });
      print(activities);
    });
  }
}
