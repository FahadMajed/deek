import 'package:deek/lib.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewController = ref.watch(notificationsViewCtrlPvdr);

    return OnboardingPage(
      label: 'التنبيهات',
      iconData: Icons.notifications,
      desc: 'بنحتاج تسمح لنا بالتنبهيات عشان يرن منبهك بالوقت المناسب',
      buttonTitle: 'طلب السماح بالتنبيهات',
      onPressed: viewController.onRequestPermission,
    );
  }
}
