import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../auth/domain/entities/user.dart';
import 'auth_guard.dart';
import '../../modules/auth/presentation/pages/auth_page.dart';
import '../../modules/home/presentation/pages/home_page.dart';
import '../../modules/splash/presentation/pages/splash_page.dart';
import '../test/test_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: TestRoute.page, initial: true),
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: AuthRoute.page),
      ];
}
