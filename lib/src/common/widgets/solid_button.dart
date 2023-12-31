import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';
import '../../../generated/colors.gen.dart';
import '../extensions/build_context_x.dart';

class SolidButton extends StatelessWidget {
  const SolidButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.radius = 0,
    this.isEnable = true,
    this.isLoading = false,
    this.foregroundColor = ColorName.white,
    this.backgroundColor = ColorName.primary,
    this.disableBackgroundColor = ColorName.primary,
    this.disabledForegroundColor = ColorName.black,
    this.textStyle,
    this.padding,
  });

  final String text;
  final double radius;
  final bool isEnable;
  final bool isLoading;
  final double? height;
  final double? width;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color disabledForegroundColor;
  final Color disableBackgroundColor;
  final GestureTapCallback? onPressed;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Opacity(
        opacity: (isEnable && !isLoading) ? 1 : 0.6,
        child: ElevatedButton(
          onPressed: (isEnable && !isLoading) ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: EdgeInsets.zero,
            disabledForegroundColor: disabledForegroundColor,
            disabledBackgroundColor: disableBackgroundColor,
            alignment: Alignment.center,
            textStyle: textStyle ?? context.textTheme.regular,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          child: _Body(
            isLoading: isLoading,
            text: text,
            color: foregroundColor,
            padding: padding,
            textStyle: textStyle,
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.isLoading,
    required this.text,
    required this.color,
    this.textStyle,
    this.padding,
  });

  final bool isLoading;
  final String text;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Assets.icons.topLineButton.svg(
            width: constraint.maxWidth,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          Padding(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 5),
            child: _Text(
              text: text,
              color: color,
              isLoading: isLoading,
              textStyle: textStyle,
            ),
          ),
          Assets.icons.bottomLineButton.svg(
            width: constraint.maxWidth,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          )
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    required this.isLoading,
    required this.text,
    required this.color,
    this.textStyle,
  });

  final bool isLoading;
  final String text;
  final TextStyle? textStyle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _PlaceHolder(color: color)
        : Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle ??
                context.textTheme.headlineSmall.copyWith(
                  color: color,
                  fontSize: 18,
                ),
          );
  }
}

class _PlaceHolder extends StatelessWidget {
  const _PlaceHolder({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 1.7,
          color: color,
        ),
      ),
    );
  }
}
