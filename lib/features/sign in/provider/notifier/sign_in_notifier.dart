import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/features/sign%20in/provider/notifier/sign_in_state.dart';

//stateNotifier saves state
class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(SignInState());

  void onUseremailchange(String email) {
    state = state.copyWith(email: email);
  }

  void onUserpasswordchange(String password) {
    state = state.copyWith(password: password);
  }
}

final signinNotifierProvider = StateNotifierProvider((ref) => SignInNotifier());
