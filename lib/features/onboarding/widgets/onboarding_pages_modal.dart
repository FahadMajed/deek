import 'package:deek/lib.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:sizer/sizer.dart';

final onboarding = PageController();

class OnBoardingPagesModal extends ConsumerWidget {
  const OnBoardingPagesModal({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final page = ref.watch(pageModelPvdr);
    final user = ref.watch(userPvdr);
    return ModalProgressHUD(
      inAsyncCall: user.isLoading,
      child: Container(
        color: const Color(0xff757575),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: BottomSheetContainer(
            height: 90.h,
            showCross: false,
            children: [
              SizedBox(
                height: 60.h,
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: onboarding,
                  children: const [
                    LocationPage(),
                    NotificationsPage(),
                    AlarmTimePage(),
                  ],
                ),
              ),
              sizedHeight32,
              sizedHeight32,
              sizedHeight32,
              PageViewIndicator(
                numOfPages: page.numberOfPages,
                currentPage: page.currentPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
