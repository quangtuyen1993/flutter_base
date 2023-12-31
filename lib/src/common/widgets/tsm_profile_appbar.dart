import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../extensions/build_context_x.dart';
import 'tsm_appbar.dart';
import '../../modules/auth/domain/entities/user.dart';

class TSMProfileAppbar extends TSMAppBar {
  TSMProfileAppbar({
    super.key,
    required User user,
    required Size size,
    super.elevation = 0,
    super.foregroundColor,
    super.backgroundColor,
    super.actions,
    super.bottom,
    super.shape,
    super.toolbarHeight,
    super.systemUiOverlayStyle,
  }) : super(
          leadingWidth:
              size.width - (actions?.length ?? 0) * Constants.appBarIconSize,
          leading: AppBarAction(
            builder: (_, __) => GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: _UserInfo(user, color: foregroundColor),
              ),
            ),
          ),
        );
}

class _UserInfo extends StatelessWidget {
  final User user;
  final Color? color;

  const _UserInfo(this.user, {this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.s.home_welcome_back,
            style: context.textTheme.headlineMedium
                .copyWith(fontSize: 14, color: color),
          ),
          Text(
            user.name,
            style: context.textTheme.headlineMedium.copyWith(color: color),
          )
        ],
      ),
    );
  }
}
