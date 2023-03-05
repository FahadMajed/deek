import 'package:deek/lib.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class SettingsModal extends ConsumerWidget {
  const SettingsModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userPvdr);
    final user = userAsync.value;
    final viewController = ref.read(settingsViewCtrlPvdr);
    return ModalProgressHUD(
      inAsyncCall: userAsync.isLoading,
      child: Container(
        color: const Color(0xff757575),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: BottomSheetContainer(
            height: 90.h,
            showCross: false,
            children: [
              const Text(
                "الاعدادات",
                style: TextStyle(
                  color: darkPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              sizedHeight32,
              //it would be better of this widget is watching settings tiles,
              for (final tile in settingsTiles)
                SettingTileContainer(
                  onTap: (setting) => viewController.onTileTap(setting),
                  tile: tile,
                  checkBoxValue: user?.hasAlarms ?? true,
                )
            ],
          ),
        ),
      ),
    );
  }
}
