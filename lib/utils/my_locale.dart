import 'package:bloc_task/data/services/api_service/api_service.dart';
import 'package:get_it/get_it.dart';

final myLocale = GetIt.instance;

void setUp() {
  myLocale.registerLazySingleton(() => ApiService());
}