import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/home_api_service.dart';
import '../models/specializations_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo({required HomeApiService homeApiService})
      : _homeApiService = homeApiService;

  Future<ApiResult<ResponseSpecializationsModel>> getSpecializations() async {
    try {
      ResponseSpecializationsModel response =
          await _homeApiService.getSpecialities();
      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
