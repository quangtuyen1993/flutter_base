import 'package:flutter/material.dart';
import '../../../../../../generated/assets.gen.dart';
import '../../../../../../generated/colors.gen.dart';
import '../../../../../common/widgets/tsm_appbar.dart';
import '../../../../../common/widgets/tsm_profile_appbar.dart';
import '../../../../auth/domain/entities/user.dart';
import '../widgets/home_body.dart';

class VolunteerHomePage extends StatelessWidget {
  final User user;

  const VolunteerHomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: TSMProfileAppbar(
        user: user,
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
                color: ColorName.primary.withOpacity(0.3), width: 1.5)),
      ),
      body: const HomeBody(),
    );
  }
}
