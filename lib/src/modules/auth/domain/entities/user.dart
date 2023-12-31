import 'dart:ui';

import 'package:enum_annotation/enum_annotation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../generated/colors.gen.dart';

part 'user.g.dart';

@generate
@JsonEnum(valueField: 'role')
enum UserRole {
  staff('staff'),
  volunteer('volunteer');

  const UserRole(this.role);

  final String role;
}

@generate
@JsonEnum(valueField: 'tier')
enum UserTier {
  bronze('bronze', [ColorName.bronzeStart, ColorName.bronzeMid, ColorName.bronzeEnd]),
  sliver('sliver', [ColorName.sliverStart, ColorName.sliverEarlyMid, ColorName.sliverLateMid, ColorName.sliverEnd]),
  gold('gold', [ColorName.goldStart, ColorName.goldMid, ColorName.goldEnd]),
  diamond('diamond', [ColorName.diamondStart, ColorName.diamondEnd]);

  final List<Color> colors;
  final String tier;
  const UserTier(this.tier, this.colors);
}

abstract class User {
  String get firstName;
  String get lastName;
  String get name;
  String get email;
  String get avatar;
  UserRole get role;
  UserTier get tier;

  Map<String, dynamic> toJson();
}
