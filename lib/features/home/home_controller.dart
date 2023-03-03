import 'package:deek/lib.dart';

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

  onEdit() {}
}

final homeViewCtrlPvdr = Provider((ref) => HomeViewController(ref.read));
