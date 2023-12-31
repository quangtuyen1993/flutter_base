import 'package:flutter/material.dart';

import '../extensions/int_duration.dart';

///Widget that draw a beautiful checkbox rounded. Provided with animation if wanted
class RoundCheckBox extends StatefulWidget {
  const RoundCheckBox({
    super.key,
    this.isChecked,
    this.checkedWidget,
    this.uncheckedWidget,
    this.checkedColor,
    this.uncheckedColor,
    this.disabledColor,
    this.border,
    this.borderColor,
    this.checkedBorderColor,
    this.size,
    this.animationDuration,
    this.borderRadius,
    required this.onTap,
  });

  ///Define wether the checkbox is marked or not
  final bool? isChecked;

  ///Define the widget that is shown when Widgets is checked
  final Widget? checkedWidget;

  ///Define the widget that is shown when Widgets is unchecked
  final Widget? uncheckedWidget;

  ///Define the color that is shown when Widgets is checked
  final Color? checkedColor;

  ///Define the color that is shown when Widgets is unchecked
  final Color? uncheckedColor;

  ///Define the color that is shown when Widgets is disabled
  final Color? disabledColor;

  ///Define the border of the widget
  final Border? border;

  ///Define the border color  of the widget
  final Color? borderColor;
  final Color? checkedBorderColor;

  ///Define the size of the checkbox
  final double? size;

  ///Define Function that os executed when user tap on checkbox
  ///If onTap is given a null callback, it will be disabled
  final Function(bool)? onTap;

  ///Define the duration of the animation. If any
  final Duration? animationDuration;

  /// The border radius of the rounded corners.
  ///
  /// Values are clamped so that horizontal and vertical radii sums do not
  /// exceed width/height.
  ///
  /// This value is ignored if [clipper] is non-null.
  final BorderRadius? borderRadius;

  @override
  RoundCheckBoxState createState() => RoundCheckBoxState();
}

class RoundCheckBoxState extends State<RoundCheckBox> {
  bool isChecked = false;
  late Duration animationDuration;
  late double size;
  Widget? checkedWidget;
  Widget? uncheckedWidget;
  Color? checkedColor;
  Color? uncheckedColor;
  Color? disabledColor;
  late Color borderColor;
  late Color checkedBorderColor;

  @override
  void initState() {
    isChecked = widget.isChecked ?? false;
    animationDuration = widget.animationDuration ?? 500.milliseconds;
    size = widget.size ?? 40.0;
    checkedColor = widget.checkedColor ?? Colors.green;
    uncheckedColor = widget.uncheckedColor;
    borderColor = widget.borderColor ?? Colors.grey;
    checkedBorderColor = widget.checkedBorderColor ?? Colors.grey;
    final checkedSize = size * 0.80;
    checkedWidget = widget.checkedWidget ??
        Icon(Icons.check, color: Colors.white, size: checkedSize);
    uncheckedWidget = widget.uncheckedWidget ?? const SizedBox.shrink();
    super.initState();
  }

  @override
  void didUpdateWidget(RoundCheckBox oldWidget) {
    uncheckedColor =
        widget.uncheckedColor ?? Theme.of(context).scaffoldBackgroundColor;
    if (isChecked != widget.isChecked) {
      isChecked = widget.isChecked ?? false;
    }
    if (animationDuration != widget.animationDuration) {
      animationDuration = widget.animationDuration ?? 500.milliseconds;
    }
    if (size != widget.size) {
      size = widget.size ?? 40.0;
    }
    if (checkedColor != widget.checkedColor) {
      checkedColor = widget.checkedColor ?? Colors.green;
    }
    if (borderColor != widget.borderColor) {
      borderColor = widget.borderColor ?? Colors.grey;
    }
    if (checkedBorderColor != widget.checkedBorderColor) {
      checkedBorderColor = widget.checkedBorderColor ?? Colors.grey;
    }
    if (checkedWidget != widget.checkedWidget) {
      final checkedSize = size * 0.80;
      checkedWidget = widget.checkedWidget ??
          Icon(Icons.check, color: Colors.white, size: checkedSize);
    }
    if (uncheckedWidget != widget.uncheckedWidget) {
      uncheckedWidget = widget.uncheckedWidget ?? const SizedBox.shrink();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.onTap != null
        ? GestureDetector(
            onTap: () {
              setState(() => isChecked = !isChecked);
              widget.onTap!(isChecked);
            },
            child: ClipRRect(
              borderRadius: borderRadius,
              child: AnimatedContainer(
                duration: animationDuration,
                height: size,
                width: size,
                decoration: BoxDecoration(
                  color: isChecked ? checkedColor : uncheckedColor,
                  border: widget.border ??
                      Border.all(
                        color: isChecked ? checkedBorderColor : borderColor,
                      ),
                  borderRadius: borderRadius,
                ),
                child: isChecked ? checkedWidget : uncheckedWidget,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: borderRadius,
            child: AnimatedContainer(
              duration: animationDuration,
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: widget.disabledColor ?? Theme.of(context).disabledColor,
                border: widget.border ??
                    Border.all(
                      color: widget.disabledColor ??
                          Theme.of(context).disabledColor,
                    ),
                borderRadius: borderRadius,
              ),
              child: isChecked ? checkedWidget : uncheckedWidget,
            ),
          );
  }

  BorderRadius get borderRadius {
    if (widget.borderRadius==null) {
      return BorderRadius.circular(size / 2);
    } else {
      return widget.borderRadius ?? BorderRadius.zero;
    }
  }
}
