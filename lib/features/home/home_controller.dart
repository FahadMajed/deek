import 'package:deek/features/settings/settings_modal.dart';
import 'package:deek/lib.dart';
import 'package:flutter/material.dart';

class HomeViewController extends AsyncViewController<User> {
  late final UserRepository userRepository;

  HomeViewController(super.read) : super(viewModelPvdr: userPvdr) {
    getUser();
  }

  Future<void> getUser() async {
    if (viewModel.value == User.empty()) {
      emitLoading();
      final user = await userRepository.getById("1");
      emitData(user);
    }
  }

  void onEdit() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: Get.overlayContext!,
      builder: (ctx) => const SettingsModal(),
    );
  }
}

final homeViewCtrlPvdr = Provider((ref) => HomeViewController(ref.read));
