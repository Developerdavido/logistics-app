


  import 'package:get_it/get_it.dart';
import 'package:logistics_app/core/services/https_service.dart';

final GetIt locator = GetIt.instance;

 setUpLocator() {
   locator.registerLazySingleton<HttpService>(() => HttpService());
 }