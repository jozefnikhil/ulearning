import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'application_nav_notifier.g.dart';

@riverpod
class ApplicationNavNotifier extends _$ApplicationNavNotifier {
  @override
  int build() {
    return 0;
  }

  void changeindex(int val) {
    state = val;
  }
}
