import 'package:dio/dio.dart';
import 'package:doc_doc/core/networking/api_consts.dart';
import 'package:retrofit/http.dart';

import '../models/specializations_model.dart';

part 'home_api_service.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio)=_HomeApiService;
  @GET(ApiConstants.specializations)
  Future<ResponseSpecializationsModel> getSpecialities();
}
