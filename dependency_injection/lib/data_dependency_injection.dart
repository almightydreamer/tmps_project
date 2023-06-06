import 'package:data/core/db/db.dart';
import 'package:data/modules/home/datasource/local_datasource.dart';
import 'package:data/modules/home/repository/action_repository_impl.dart';
import 'package:data/modules/home/repository/activity_repository_impl.dart';
import 'package:domain/modules/home/action/repository/action_repository.dart';
import 'package:domain/modules/home/activity/repository/activity_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  final dataDi = GetIt.instance;
  print('DataDI : initialization started');

  dataDi.registerLazySingleton<LocalDatabase>(() => LocalDatabase());

  dataDi.registerLazySingleton<LocalDataSource>(() => LocalDataSource(db: dataDi<LocalDatabase>()));

  dataDi.registerLazySingleton<ActionRepository>(
      () => ActionRepositoryImpl(localDataSource: dataDi<LocalDataSource>()));

  dataDi.registerLazySingleton<ActivityRepository>(
          () => ActivityRepositoryImpl(localDataSource: dataDi<LocalDataSource>()));


  print('DataDI : initialization finished');
}
