import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';
import '../../../generated/colors.gen.dart';
import '../../common/widgets/solid_button.dart';
import '../../common/widgets/tsm_appbar.dart';
import '../../common/widgets/tsm_profile_appbar.dart';
import '../auth/infrastructure/models/user_model.dart';

@RoutePage()
class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: TSMProfileAppbar(
        user: const UserModel(
          firstName: 'Chan',
          lastName: 'Tai Man'
        ),
        foregroundColor: ColorName.darkGray,
        backgroundColor: ColorName.background,
        size: MediaQuery.sizeOf(context),
        actions: [
          AppBarAction(
            src: Assets.icons.icCalendarToday,
            onPressed: () async => {},
          ),
          AppBarAction(
            src: Assets.icons.icBell,
            onPressed: () async => {},
          ),
          AppBarAction(
            src: Assets.icons.icQrcode,
            onPressed: () async => {},
          ),
        ],
        shape: Border(
            bottom: BorderSide(
                color: ColorName.primary.withOpacity(0.3),
                width: 1.5
            )
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: SolidButton(
              text: 'REGISTER',
              onPressed: () {},
              isLoading: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: SolidButton(
              text: 'BACK TO SERVICE DETAIL',
              onPressed: () {},
              isEnable: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: SolidButton(
              text: 'VIEW BOOKING DETAIL',
              backgroundColor: Colors.white,
              foregroundColor: ColorName.primary,
              disableBackgroundColor: ColorName.primary.withOpacity(0.1),
              disabledForegroundColor: ColorName.primary,
              isEnable: true,
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: SolidButton(
              text: 'CHECK IN',
              backgroundColor: ColorName.secondary,
              foregroundColor: ColorName.white,
              disableBackgroundColor: ColorName.secondary,
              disabledForegroundColor: ColorName.white,
              isEnable: true,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
