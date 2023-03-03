import 'package:deek/lib.dart';
import 'package:flutter/material.dart';

class LocationPage extends ConsumerWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewController = ref.watch(locationViewCtrlPvdr);

    return OnboardingPage(
      iconData: Icons.location_pin,
      label: 'الموقع',
      desc: 'بنحتاج موقعك عشان نحدد وقت صلاة الفجر بمدينتك',
      buttonTitle: 'طلب السماح بالموقع',
      onPressed: viewController.onActionButtonPressed,
    );
  }
}
