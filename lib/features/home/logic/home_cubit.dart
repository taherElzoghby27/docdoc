import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/home/data/models/specializations_model.dart';
import 'package:doc_doc/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationModel> specializations = [];
  List<DoctorModel> doctors = [];
  int currentPage = 0;
  changeCurrentPage(int id) async {
    currentPage = id;
    await getDoctors(id: currentPage);
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
    emit(const HomeState.doctorsLoading());
    doctors = await getSpecializationsForDoctors(id);
    emit(HomeState.doctorsSuccess(doctors));
  }

//filter doctors
  Future<List<DoctorModel>> getSpecializationsForDoctors(int id) async {
    SpecializationModel specializationsDoctors =
        specializations.where((item) => item.id == id).first;
    List<DoctorModel> doctorsList = specializationsDoctors.doctors;
    return doctorsList;
  }
}
