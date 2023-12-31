import 'package:asuka/asuka.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../generated/l10n.dart';
import '../../common/theme/app_theme_wrapper.dart';
import '../../common/theme/app_theme.dart';
import '../../common/utils/getit_utils.dart';
import '../../core/application/cubits/auth/auth_cubit.dart';
import '../../core/application/cubits/lang/lang_cubit.dart';
import 'MyObserver.dart';
import 'app_router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    final stream = context.read<AuthCubit>().stream;
    return BlocBuilder<LangCubit, Locale>(
      builder: (context, locale) {
        return AppThemeWrapper(
            appTheme: AppTheme.create(locale),
            builder: (BuildContext context, ThemeData themeData) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: locale,
                builder: Asuka.builder,
                theme: themeData,
                routerConfig: router.config(
                    navigatorObservers: () => [MyObserver()],
                    reevaluateListenable: ReevaluateListenable.stream(stream)),
              );
            });
      },
    );
  }
}
