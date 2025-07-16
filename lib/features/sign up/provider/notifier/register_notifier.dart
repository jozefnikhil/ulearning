import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/features/sign%20up/provider/notifier/register_state.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void onUsernamechange(String name) {
    log('onUsernamechange called with $name');
    state = state.copyWith(username: name);
  }

  void onUseremailchange(String email) {
    state = state.copyWith(email: email);
  }

  void onUserpasswordchange(String password) {
    state = state.copyWith(password: password);
  }

  void onUserconfirmpasswordchange(String confirmpassword) {
    state = state.copyWith(confirmpassword: confirmpassword);
  }
}
