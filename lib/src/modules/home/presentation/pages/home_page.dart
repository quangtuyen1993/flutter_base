import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/user_layout_builder.dart';
import '../../../staff/home/presentation/pages/home_page.dart';
import '../../../volunteer/home/presentation/pages/home_page.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return UserLayoutBuilder(
      staffBuilder: (context, user) {
        return StaffHomePage(user: user);
      },
      volunteerBuilder: (context, user) {
        return VolunteerHomePage(user: user);
      },
    );
  }
}
