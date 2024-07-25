class SignUpRequestBody {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String phoneNumber;
  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'phone': phoneNumber,
        'password_confirmation': passwordConfirmation
      };
}
