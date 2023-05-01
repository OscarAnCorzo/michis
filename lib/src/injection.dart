
import 'package:get_it/get_it.dart';
import 'package:michis/src/features/data/datasource/remote_datasource.dart';
import 'package:michis/src/features/data/repositories/cats_repository_impl.dart';
import 'package:michis/src/features/domain/repositories/cats_repository.dart';
import 'package:michis/src/features/domain/usecases/get_cats_usecase.dart';
import 'package:michis/src/features/presentation/controllers/landing_controller.dart';
import 'package:michis/src/features/presentation/controllers/splash_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerFactory(() => SplashController());
  sl.registerFactory(() => LandingController(getCatsUseCase: sl()));

  sl.registerLazySingleton(() => GetCatsUseCase(sl()));

  sl.registerLazySingleton<CatsRepository>(() => CatsRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}