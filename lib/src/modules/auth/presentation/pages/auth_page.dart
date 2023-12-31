import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../generated/colors.gen.dart';
import '../../domain/entities/user.dart';
import '../widgets/auth_body.dart';

@RoutePage<User>()
class AuthPage extends StatelessWidget {
  final void Function(User? isLoggedIn)? onLoginResult;

  const AuthPage({super.key, this.onLoginResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: ColorName.background,
        ),
        child: AuthBody(onLoginResult: onLoginResult),
      ),
    );
  }
}
