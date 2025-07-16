class RegisterState {
  final String username;
  final String email;
  final String password;
  final String confirmpassword;

  const RegisterState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.confirmpassword = '',
  });

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmpassword,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmpassword: confirmpassword ?? this.confirmpassword,
    );
  }
}
