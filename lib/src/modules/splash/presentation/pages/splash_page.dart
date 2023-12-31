import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../generated/colors.gen.dart';
import '../../../../common/extensions/int_duration.dart';
import '../../../../common/utils/getit_utils.dart';
import '../../../app/app_router.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: ColorName.background,
        statusBarColor: ColorName.background,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: FutureBuilder(
          future: Future.delayed(2.seconds),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              getIt<AppRouter>().replaceAll([const HomeRoute()]);
            }
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }
}
