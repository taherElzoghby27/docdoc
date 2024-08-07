import 'package:dio/dio.dart';
import 'package:doc_doc/core/networking/api_service.dart';
import 'package:doc_doc/core/networking/dio_factory.dart';
import 'package:doc_doc/features/home/data/data_source/home_api_service.dart';
import 'package:doc_doc/features/home/data/repo/home_repo.dart';
import 'package:doc_doc/features/login/data/repos/login_repo.dart';
import 'package:doc_doc/features/login/logic/cubit/login_cubit.dart';
import 'package:doc_doc/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:doc_doc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
setupGetIt() async {
  //Api Service & dio
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //login repo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  //login cubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //sign up repo
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  //sign up cubit
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  //home api service
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  //home repo
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(
      homeApiService: getIt(),
    ),
  );
}
