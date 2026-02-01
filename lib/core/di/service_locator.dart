
// import 'package:bloclearnbyproject/feature/data/repositories/product_repository.dart' hide AuthRepository;
import 'package:get_it/get_it.dart';

import '../../presentetion/auth/auth_repo/auth_repository.dart';
import '../network/api_client.dart';


final sl = GetIt.instance;

Future<void> initDependencies() async {
  // ---------- API CLIENTS ----------
  // sl.registerLazySingleton<ApiClient>(
  //       () => ApiClient(baseUrl: "https://jsonplaceholder.typicode.com"),
  //   instanceName: "jsonApi",
  // );

  sl.registerLazySingleton<ApiClient>(
        () => ApiClient(),
    instanceName: "authApi",
  );

  // sl.registerLazySingleton<ApiClient>(
  //       () => ApiClient(baseUrl: "https://fakestoreapi.com"),
  //   instanceName: "productApi",
  // );

  // ---------- REPOSITORIES ----------


  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepository(
      apiClient: sl<ApiClient>(instanceName: "authApi"),
    ),
  );


}
