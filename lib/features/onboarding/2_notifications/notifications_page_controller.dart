import 'package:deek/lib.dart';

class NotificationsViewController extends OnboardingViewController {
  late final NotificationsService notificationsService;

  NotificationsViewController(super.read) {
    notificationsService = read(notificationsSrvcPvdr);
  }

  @override
  Future<void> onActionButtonPressed() async {
    await notificationsService.requestPermission().then((_) => showNextPage());
  }
}

final notificationsViewCtrlPvdr =
    Provider((ref) => NotificationsViewController(ref.read));
