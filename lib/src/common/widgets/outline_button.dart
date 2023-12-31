import 'package:flutter/material.dart';

import '../../../generated/colors.gen.dart';
import '../extensions/build_context_x.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 48,
    this.radius = 24,
    this.isEnable = true,
    this.isLoading = false,
    this.foregroundColor = ColorName.primary,
    this.strokeColor = ColorName.primary,
    this.style,
  });

  final String text;
  final double radius;
  final bool isEnable;
  final double height;
  final bool isLoading;
  final double width;
  final Color foregroundColor;
  final Color strokeColor;
  final TextStyle? style;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Opacity(
        opacity: (isEnable && !isLoading) ? 1 : 0.5,
        child: OutlinedButton(
            onPressed: (isEnable && !isLoading) ? onPressed : null,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              side: BorderSide(width: 1.2, color: strokeColor),
              disabledForegroundColor: Colors.grey.shade300,
              alignment: Alignment.center,
              textStyle: _createTextStyle(context),
              foregroundColor: foregroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            child: isLoading
                ? Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.7,
                        color: foregroundColor,
                      ),
                    ),
                  )
                : Text(text)),
      ),
    );
  }

  TextStyle? _createTextStyle(BuildContext context) {
    var style = this.style ?? context.textTheme.regular;
    return style;
  }
}
