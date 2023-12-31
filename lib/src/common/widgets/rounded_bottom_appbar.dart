import 'package:flutter/material.dart';

class RoundedBottomAppbar extends AppBar {
  RoundedBottomAppbar({
    super.key,
    double toolbarHeight = 60,
  }) : super(
          toolbarHeight: 200,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(800, 100.0),
            ),
          ),
        );
}
