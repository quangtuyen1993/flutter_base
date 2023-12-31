import 'package:auto_route/auto_route.dart';

import 'app_router.dart';
import '../auth/domain/entities/user.dart';
import '../auth/domain/interfaces/auth_repository_interface.dart';
import '../../common/utils/getit_utils.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    final authRepository = getIt<IAuthRepository>();
    final isLogin = await authRepository.isLoggedIn();
    if (isLogin) {
      resolver.next();
    } else {
      // else we navigate to the Login page so we get authenticated

      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(AuthRoute(onLoginResult: (user) {
        resolver.resolveNext(user is User, reevaluateNext: false);
      }));
    }
  }
}
