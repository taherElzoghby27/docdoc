import 'package:doc_doc/core/networking/api_error_handler.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/home/data/data_source/home_api_service.dart';
import 'package:doc_doc/features/home/data/models/specializations_model.dart';

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
