import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/validator.dart';
import '../../../../modules/auth/domain/entities/user.dart';
import '../../../../modules/auth/domain/interfaces/auth_repository_interface.dart';
import '../../../domain/errors/auth_error.dart';
import '../../../infrastructure/datasources/remote/api/services/auth/models/login_request.dart';

part 'auth_cubit.freezed.dart';

part 'auth_state.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _repository;

  AuthCubit._(
    this._repository,
    AuthState initialState,
  ) : super(initialState);

  @FactoryMethod(preResolve: true)
  static Future<AuthCubit> create(IAuthRepository repo) async {
    final isLoggedIn = await repo.isLoggedIn();
    final user = repo.getUser();
    final initialState = isLoggedIn
        ? AuthState.authenticated(user!)
        : const AuthState.unauthenticated();
    return AuthCubit._(repo, initialState);
  }

  Future<void> login(LoginRequest request) async {
    if (!Validator.isValidEmail(request.email)) {
      emit(const _Error(AuthError.invalidEmail()));
    } else if (!Validator.isValidPassword(request.password)) {
      emit(const _Error(AuthError.invalidPassword()));
    } else {
      emit(const _Loading());
      final result = await _repository.login(request);
      emit(result.fold(
        (l) => _Error(AuthError.other(l.message)),
        (r) {
          _repository.setUser(r);
          return _Authenticated(r);
        },
      ));
    }
  }

  void logout() async {
    await state.whenOrNull(authenticated: (_) async {
      emit(const _Loading());
      await _repository.logout();
      emit(const _Unauthenticated());
    });
  }
}
