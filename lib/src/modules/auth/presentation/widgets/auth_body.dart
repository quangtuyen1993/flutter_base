import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../../generated/colors.gen.dart';
import '../../../../common/extensions/build_context_x.dart';
import '../../../../common/widgets/solid_button.dart';
import '../../../../core/application/cubits/auth/auth_cubit.dart';
import '../../../../core/infrastructure/datasources/remote/api/services/auth/models/login_request.dart';
import '../../domain/entities/user.dart';

class AuthBody extends StatefulWidget {
  final void Function(User? isLoggedIn)? onLoginResult;

  const AuthBody({super.key, this.onLoginResult});

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.background,
      child: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              authenticated: widget.onLoginResult,
              error: (error) => error.whenOrNull(
                other: (message) => _showError(message),
              ),
            );
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 16.0,
                  children: [
                    Assets.images.welcome.image(),
                    TextField(
                      controller: _emailTextEditingController,
                      decoration: InputDecoration(
                        label: Text(context.s.email),
                        hintText: 'example@domain.com',
                        errorText: state.whenOrNull<String?>(
                          error: (error) => error.whenOrNull(
                            invalidEmail: () => context.s.error_invalid_email,
                          ),
                        ),
                        errorMaxLines: 2,
                      ),
                    ),
                    TextField(
                      obscureText: !_passwordVisible,
                      controller: _passwordTextEditingController,
                      decoration: InputDecoration(
                        label: Text(context.s.password),
                        hintText: 'aA12345@',
                        errorText: state.whenOrNull<String?>(
                          error: (error) => error.whenOrNull(
                            invalidPassword: () =>
                                context.s.error_invalid_password,
                          ),
                        ),
                        errorMaxLines: 2,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    SolidButton(
                      isLoading: state.maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      ),
                      text: context.s.login,
                      onPressed: () => _login(context),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    final email = _emailTextEditingController.text;
    final password = _passwordTextEditingController.text;
    await context
        .read<AuthCubit>()
        .login(LoginRequest(email: email, password: password));
  }

  void _showError(String message) {
    Asuka.showDialog(
      barrierDismissible: false,
      builder: (alertContext) => CupertinoAlertDialog(
        title: Text(alertContext.s.error),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: Text(alertContext.s.ok),
            onPressed: () => Navigator.pop(alertContext),
          )
        ],
      ),
    );
  }
}
