import 'package:deek/lib.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:rflutter_alert/rflutter_alert.dart';

import 'edit_minutes_variation/edit_minutes_variation_alert.dart';

class SettingsRouter extends Router {
  @override
  void onFail(message) {}

  @override
  void onSuccess({Map? params, String? message}) {}

  void showEdit({required Function onSave}) {
    Alert(
        context: Get.overlayContext!,
        style: const AlertStyle(
          backgroundColor: nuteralColor,
        ),
        content: const EditMinutesVariation(),
        buttons: [
          DialogButton(
            color: primaryColor,
            onPressed: () {
              Get.close(1);
              onSave.call();
            },
            child: const Text(
              "حفظ",
              style: TextStyle(color: Colors.white),
            ),
          )
        ]).show();
  }

  void oAlarmEditedSucess() {
    Toast.success(
      "تغير وقت الاذان للوقت اللي تبيه",
      pop: true,
      times: 1,
    );
  }

  void onLocationChangeSuccess() {
    Toast.success(
      "تغير الاذان للموقع الجديد",
      pop: true,
    );
  }
}
