import 'dart:async';
import 'dart:ffi';
import 'package:domain/modules/home/action/entity/action_entity.dart';
import 'package:domain/modules/home/action/usecase/get_actions_usecase.dart';
import 'package:domain/modules/home/action/usecase/save_actions_usecase.dart';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:domain/modules/home/activity/usecase/get_activities_usecase.dart';
import 'package:domain/modules/home/activity/usecase/resume_activity_usecase.dart';
import 'package:domain/modules/home/activity/usecase/save_activity_usecase.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/pages/home/controllers/cache_controller.dart';

class HomeController extends GetxController {
  RxList<ActionEntity> actions = RxList();

  final _saveActionsUseCase = GetIt.instance.get<SaveActionsUseCase>();
  final _saveActivityUseCase = GetIt.instance.get<SaveActivityUseCase>();
  final _getActionsUseCase = GetIt.instance.get<GetActionsUseCase>();
  final _getActivitiesUseCase = GetIt.instance.get<GetActivitiesUseCase>();
  final _getLastActivityUseCase = GetIt.instance.get<GetLastActivityUseCase>();

  RxBool isStarted = false.obs;
  Rxn<ActivityEntity> currentActivity = Rxn();
  RxInt timerValue = 0.obs;
  RxBool addingAction = false.obs;
  RxBool savingActivity = false.obs;

  Future<void> saveActions(ActionEntity action) async {
    var response = await _saveActionsUseCase.call([action]);
    response.fold((l) {}, (r) {});
  }

  Future<void> getActions() async {
    print('getActions');
    var response = _getActionsUseCase.call();
    response.listen((event) {
      event.fold((l) => null, (r) => actions.value = r);
    });
  }

  Future<void> resumeActivity() async {
    var response = await _getLastActivityUseCase.call();
    response.fold((l) => null, (r) {
      if (r.endOfActivity == null) {
        currentActivity.value = r;
        timerValue += DateTime.now().difference(r.startOfActivity).inSeconds;
      }
    });
  }

  void resetTimer() {
    timerValue.value = 0;
  }

  void draggedAction(ActionEntity entity) {
    isStarted.value = true;
    CacheController cacheController = Get.find();
    var activityEntity = ActivityEntity(
      day: DateTime.now().day,
      actionId: entity.actionId!,
      actionName: entity.actionName,
      startOfActivity: DateTime.now(),
    );
    if(currentActivity.value != null) {
      cacheController.setPreviousActivity(currentActivity.value!, () {
      resetTimer();
      timerValue.value += 5;
      _saveActivityUseCase.call(activityEntity);
    });
      currentActivity.value = activityEntity;

    } else {
      currentActivity.value = activityEntity;
      _saveActivityUseCase.call(activityEntity);
    }
  }
}
