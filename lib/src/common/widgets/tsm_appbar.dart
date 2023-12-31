// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../generated/assets.gen.dart';
import '../../../generated/colors.gen.dart';
import '../constants/constants.dart';
import '../extensions/build_context_x.dart';
import '../extensions/num_space_x.dart';

class TSMAppBar extends AppBar {
  TSMAppBar({
    super.key,
    AppBarAction? leading,
    double? leadingWidth,
    String? title,
    Widget? titleWidget,
    List<AppBarAction>? actions,
    bool hasIconBackground = false,
    Widget? flexibleSpace,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    super.shape,
    super.automaticallyImplyLeading = false,
    super.foregroundColor = ColorName.primary,
    super.backgroundColor = Colors.transparent,
    super.centerTitle = true,
    super.elevation = 0,
    super.bottom,
    super.toolbarHeight = Constants.appBarHeight,
  }) : super(
          leadingWidth: leadingWidth ?? (Constants.appBarIconSize + 5),
          title: titleWidget ?? _Title(title ?? '', color: foregroundColor),
          leading: leading != null
              ? AppBarActionWidget(
                  option: leading, foregroundColor: foregroundColor)
              : null,
          actions: [
            AppBarActionWidgets(
              actions: actions ?? [],
              color: foregroundColor,
            )
          ],
          systemOverlayStyle: systemUiOverlayStyle ??
              SystemUiOverlayStyle.light.copyWith(
                systemNavigationBarColor: backgroundColor,
                statusBarColor: Colors.transparent,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
          flexibleSpace: flexibleSpace ??
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Assets.images.bgAppbar.image(width: 240, fit: BoxFit.cover)
                ],
              ),
        );
}

class SliverSocialAppBar extends SliverAppBar {
  SliverSocialAppBar({
    super.key,
    super.automaticallyImplyLeading = false,
    super.backgroundColor = Colors.transparent,
    super.foregroundColor = ColorName.darkGray,
    super.expandedHeight,
    super.pinned,
    super.centerTitle = true,
    super.elevation = 0.3,
    super.titleSpacing,
    super.flexibleSpace,
    super.bottom,
    super.toolbarHeight,
    SystemUiOverlayStyle? systemOverlayStyle,
    AppBarAction? leading,
    double? leadingWidth,
    String? title,
    Widget? titleWidget,
    List<AppBarAction>? actions,
    bool hasIconBackground = false,
  }) : super(
          systemOverlayStyle: systemOverlayStyle ??
              SystemUiOverlayStyle.light.copyWith(
                systemNavigationBarColor: Colors.white,
                statusBarColor: Colors.transparent,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
          leading: leading != null
              ? AppBarActionWidget(
                  option: leading, foregroundColor: foregroundColor)
              : null,
          leadingWidth: leadingWidth ?? (Constants.appBarIconSize + 5),
          title: titleWidget ?? _Title(title ?? '', color: foregroundColor),
          actions: [
            AppBarActionWidgets(actions: actions ?? [], color: foregroundColor)
          ],
        );
}

class _Title extends StatelessWidget {
  const _Title(
    this.title, {
    required this.color,
  });

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return title.isBlank
        ? const SizedBox.shrink()
        : Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.regular.copyWith(
              color: color,
            ),
          );
  }
}

class AppBarActionWidgets extends StatelessWidget {
  const AppBarActionWidgets({
    super.key,
    required this.actions,
    this.hasIconBackground = false,
    this.color = ColorName.primary,
  });

  final List<AppBarAction> actions;
  final bool hasIconBackground;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...actions.map((option) => AppBarActionWidget(
              option: option,
              foregroundColor: color,
              padding: const EdgeInsets.only(bottom: 16),
            )),
        if (actions.isNotEmpty)
          (20 - (Constants.appBarIconSize - 24) / 2).spaceW
      ],
    );
  }
}

class AppBarActionWidget extends StatelessWidget {
  const AppBarActionWidget({
    super.key,
    required this.option,
    this.foregroundColor,
    this.padding,
    this.backgroundIconColor = Colors.transparent,
  });

  final AppBarAction option;
  final Color? foregroundColor;
  final Color backgroundIconColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final Color color = foregroundColor ?? ColorName.primary;
    final builder = option.builder;
    return builder != null
        ? builder(context, option)
        : option.src != null
            ? Container(
                padding: padding,
                width: Constants.appBarIconSize,
                height: Constants.appBarIconSize,
                decoration: BoxDecoration(
                  color: backgroundIconColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 25,
                    constraints: const BoxConstraints(),
                    onPressed: option.onPressed,
                    icon: option.src!.svg(
                      colorFilter: ColorFilter.mode(
                        color,
                        BlendMode.srcIn,
                      ),
                    )),
              )
            : const SizedBox.shrink();
  }
}

typedef AppBarItemChild = Widget Function(BuildContext context, AppBarAction);

class AppBarAction {
  final AppBarItemChild? builder;
  final SvgGenImage? src;
  final VoidCallback? onPressed;

  AppBarAction({this.src, this.builder, this.onPressed}) {
    if (src == null && builder == null) {
      throw UnsupportedError('MenuOption must have child or src');
    }
  }
}
