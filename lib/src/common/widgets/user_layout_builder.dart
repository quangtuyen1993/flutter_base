import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/application/cubits/auth/auth_cubit.dart';
import '../../modules/auth/domain/entities/user.dart';

typedef OnUserLayoutBuilder = Widget Function(BuildContext, User);
typedef LoadingLayoutBuilder = Widget Function(BuildContext);

class UserLayoutBuilder extends StatelessWidget {
  final OnUserLayoutBuilder staffBuilder;
  final OnUserLayoutBuilder volunteerBuilder;
  final LoadingLayoutBuilder? loadingBuilder;
  final BlocWidgetListener<AuthState>? listener;

  static BlocWidgetListener<AuthState> get _defaultListener {
    return (context, user) {};
  }

  const UserLayoutBuilder({
    super.key,
    required this.staffBuilder,
    required this.volunteerBuilder,
    this.loadingBuilder,
    this.listener,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: listener ?? _defaultListener,
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (User user) => user.role.maybeWhen(
            staff: () => staffBuilder(context, user),
            orElse: () => volunteerBuilder(context, user),
          ),
          loading: () => loadingBuilder?.call(context) ?? const SizedBox(),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
