import 'package:bloc/bloc.dart';
import 'package:doc_doc/features/login/data/models/login_request_body.dart';
import 'package:doc_doc/features/login/data/repos/login_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());
  //login method
  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final result = await loginRepo.login(loginRequestBody);
    result.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (errorModel) {
        emit(
          LoginState.error(errorModel.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
