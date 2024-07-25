import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_handler.dart';
import '../data/models/specializations_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  //specializations
  const factory HomeState.specializationsLoading() = SpecializationLoading;
  const factory HomeState.specializationsError(ErrorHandler errorHandler) =
      SpecializationError;
  const factory HomeState.specializationsSuccess(
          ResponseSpecializationsModel responseSpecializationsModel) =
      SpecializationSuccess;
  //doctors
  const factory HomeState.doctorsSuccess(List<DoctorModel> doctors) =
      DoctorsSuccess;
  const factory HomeState.doctorsError(ErrorHandler errorHandler) = DoctorsError;
  //change current page
  const factory HomeState.changeCurrent() = ChangeCurrentPage;
}
