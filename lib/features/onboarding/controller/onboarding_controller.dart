import 'package:deek/lib.dart';

abstract class OnboardingViewController extends AsyncViewController<User>
    with PageViewController {
  OnboardingViewController(super.read) : super(viewModelPvdr: userPvdr);

  Future<void> onActionButtonPressed();

  void showNextPage() {
    incrementPage();
    onboarding.showNextPage();
  }
}
