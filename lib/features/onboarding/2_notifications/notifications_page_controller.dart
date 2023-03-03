import 'package:deek/lib.dart';

class NotificationsViewController extends AsyncViewController<User>
    with PageViewController {
  late final NotificationsService notificationsService;

  NotificationsViewController(super.read) : super(viewModelPvdr: userPvdr) {
    notificationsService = read(notificationsSrvcPvdr);
  }

  Future<void> onRequestPermission() async {
    await notificationsService.requestPermission().then((_) => incrementPage());
  }
}

final notificationsViewCtrlPvdr =
    Provider((ref) => NotificationsViewController(ref.read));
