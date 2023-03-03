import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueXX on AsyncValue {
  bool get isLoading => when(
        data: (_) => false,
        error: (_, __) => false,
        loading: () => true,
      );
}
