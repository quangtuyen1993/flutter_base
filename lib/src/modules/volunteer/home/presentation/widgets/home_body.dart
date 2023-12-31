import 'package:flutter/material.dart';

import '../../../../../../generated/colors.gen.dart';
import '../../../../../common/widgets/solid_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: SolidButton(
            text: 'REGISTER',
            onPressed: () {},
            isLoading: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: SolidButton(
            text: 'BACK TO SERVICE DETAIL',
            onPressed: () {},
            isEnable: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: SolidButton(
            text: 'VIEW BOOKING DETAIL',
            backgroundColor: Colors.white,
            foregroundColor: ColorName.primary,
            disableBackgroundColor: ColorName.primary.withOpacity(0.1),
            disabledForegroundColor: ColorName.primary,
            isEnable: true,
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: SolidButton(
            text: 'CHECK IN',
            backgroundColor: ColorName.secondary,
            foregroundColor: ColorName.white,
            disableBackgroundColor: ColorName.secondary,
            disabledForegroundColor: ColorName.white,
            isEnable: true,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
