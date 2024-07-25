import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/networking/api_error_handler.dart';
import '../../../core/networking/api_result.dart';
import '../data/models/specializations_model.dart';
import '../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationModel> specializations = [];
  List<DoctorModel>? doctors = [];
  int currentPage = 1;
  changeCurrentPage(int id) async {
    currentPage = id;
    emit(const HomeState.changeCurrent());
  }

  //get specializations
  getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    ApiResult<ResponseSpecializationsModel> result =
        await _homeRepo.getSpecializations();
    result.when(
      success: (response) {
        specializations = response.specializations;
        emit(
          HomeState.specializationsSuccess(response),
        );
        getDoctors(id: specializations.first.id);
      },
      failure: (errorModel) {
        emit(
          HomeState.specializationsError(errorModel),
        );
      },
    );
  }

  getDoctors({int id = 1}) async {
    doctors = await getSpecializationsForDoctors(id);
    if (doctors.isNullOrEmpty()) {
      emit(HomeState.doctorsError(ErrorHandler.handle('No Doctors Found!')));
    } else {
      emit(HomeState.doctorsSuccess(doctors!));
    }
  }

//filter doctors
  Future<List<DoctorModel>?> getSpecializationsForDoctors(
    int specializationId,
  ) async {
    SpecializationModel specializationsDoctors = specializations
        .firstWhere((specialization) => specialization.id == specializationId);
    List<DoctorModel> doctorsList = specializationsDoctors.doctors;
    return doctorsList;
  }
}
