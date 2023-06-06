import 'package:domain/modules/home/action/usecase/get_actions_usecase.dart';
import 'package:domain/modules/home/action/usecase/save_actions_usecase.dart';
import 'package:domain/modules/home/action/repository/action_repository.dart';
import 'package:domain/modules/home/activity/usecase/get_activities_usecase.dart';
import 'package:domain/modules/home/activity/usecase/save_activity_usecase.dart';
import 'package:domain/modules/home/activity/usecase/resume_activity_usecase.dart';
import 'package:domain/modules/home/activity/repository/activity_repository.dart';

import 'package:get_it/get_it.dart';

Future<void> init() async {
  final domainDi = GetIt.instance;
  print('DomainDI : initialization started');

  domainDi.registerLazySingleton<GetActivitiesUseCase>(() => GetActivitiesUseCase(domainDi<ActivityRepository>()));
  domainDi.registerLazySingleton<SaveActivityUseCase>(() => SaveActivityUseCase(domainDi<ActivityRepository>()));
  domainDi.registerLazySingleton<GetActionsUseCase>(() => GetActionsUseCase(domainDi<ActionRepository>()));
  domainDi.registerLazySingleton<SaveActionsUseCase>(() => SaveActionsUseCase(domainDi<ActionRepository>()));
  domainDi.registerLazySingleton<GetLastActivityUseCase>(() => GetLastActivityUseCase(domainDi<ActivityRepository>()));

  print('DomainDI : initialization finished');
}
