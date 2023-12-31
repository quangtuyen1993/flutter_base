import 'package:flutter/material.dart';

extension SpaceX on num {
  SizedBox get spaceW {
    return SizedBox(
      width: toDouble(),
    );
  }

  SizedBox get spaceH {
    return SizedBox(
      height: toDouble(),
    );
  }
}
