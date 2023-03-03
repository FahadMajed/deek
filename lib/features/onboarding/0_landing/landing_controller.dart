import 'package:deek/lib.dart';
import 'package:flutter/material.dart';

class LandingController extends AsyncViewController<User>
    with PageViewController {
  late final CreateUser createUser;
  LandingController(super.read) : super(viewModelPvdr: userPvdr) {
    createUser = read(createUserPvdr);
    pageViewModel = const PageViewModel(
      numberOfPages: 3,
      currentPage: 0,
    );
  }

  Future<void> onStart() async {
    final user = await createUser.call();

    emitData(user);
    _showBottomSheet();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: Get.overlayContext!,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      builder: (_) => const OnBoardingPagesModal(),
    );
  }
}

final landingCtrlPvdr = Provider((ref) => LandingController(ref.read));
