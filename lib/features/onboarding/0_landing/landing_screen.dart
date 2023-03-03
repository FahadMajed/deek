import 'package:deek/features/onboarding/0_landing/landing_controller.dart';
import 'package:deek/lib.dart';
import 'package:deek/theme/colors.dart';
import 'package:flutter/material.dart';

class DeekLanding extends ConsumerWidget {
  const DeekLanding({Key? key}) : super(key: key);

  @override
  Widget build(_, ref) {
    final viewController = ref.read(landingCtrlPvdr);
    return CustomScaffold(
      scaffoldBackgroundColor: nuteralColor,
      withAppBar: false,
      withWhiteContainer: false,
      withSafeArea: false,
      resizeToAvoidBottomInset: false,
      imageFile: "w1.png",
      alignment: CrossAxisAlignment.center,
      body: [
        const Spacer(
          flex: 2,
        ),
        Text(
          'ديك',
          style: reach.copyWith(color: darkPrimary),
        ),
        SizedBox(
            height: 240, child: Image.asset("assets/images/logo no bg.png")),
        const Text(
          'منبة صلاة فجر يفهمك',
          style: titleExtraLargeBold,
        ),
        const Spacer(
          flex: 2,
        ),
        FilledButton(
          title: "ابدأ!",
          onPressed: viewController.onStart,
        ),
        const Spacer(
          flex: 6,
        ),
      ],
    );
  }
}
