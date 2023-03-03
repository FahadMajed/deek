import 'package:deek/lib.dart';

final userPvdr =
    StateProvider<AsyncValue<User>>((ref) => AsyncData(User.empty()));
