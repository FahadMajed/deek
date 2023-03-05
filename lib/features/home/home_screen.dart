import 'package:deek/lib.dart';

import 'package:flutter/material.dart';

class _HomeScreen extends ViewState<HomeScreen, AsyncValue<HomeViewModel>,
    HomeViewController> {
  _HomeScreen(super.viewModelProvider, super.viewControllerProvider);
  @override
  Widget buildView() {
    if (viewModel.isLoading) {
      return const LoadingScaffold();
    } else {
      final homeModel = viewModel.value!;
      return CustomScaffold(
        scaffoldBackgroundColor: nuteralColor,
        withAppBar: false,
        withWhiteContainer: false,
        withSafeArea: false,
        resizeToAvoidBottomInset: false,
        imageFile: "w1.png",
        alignment: CrossAxisAlignment.center,
        body: [
          const Spacer(
            flex: 5,
          ),
          LabelIconText(
            label: homeModel.label,
            iconData: homeModel.iconData,
            text: homeModel.alarmTime,
            textStyle: titleExtraLargeBold,
            spacing: sizedHeight24,
          ),
          sizedHeight16,
          Text(
            homeModel.alarmStatus,
            style: titleMidBold,
            textAlign: TextAlign.center,
          ),
          sizedHeight48,
          sizedHeight48,
          FilledButton(
            title: "تعديل",
            onPressed: viewController.onEdit,
          ),
          const Spacer(
            flex: 6,
          ),
        ],
      );
    }
  }
}

class HomeScreen extends View {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreen(
        homeViewModelPvdr,
        homeViewCtrlPvdr,
      );
}
