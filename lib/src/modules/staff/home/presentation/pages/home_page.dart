import 'package:flutter/material.dart';
import '../../../../auth/domain/entities/user.dart';
import '../widgets/home_body.dart';

class StaffHomePage extends StatelessWidget {
  final User user;

  const StaffHomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const HomeBody(),
    );
  }
}
