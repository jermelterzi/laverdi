class Credentials {
  String email;
  String password;

  Credentials({this.email = '', this.password = ''});

  bool validateEmail() {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    return emailRegex.hasMatch(email);
  }

  bool validatePassword() {
    final regex = RegExp(
      r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=.{8,}).*$',
    );

    return regex.hasMatch(password);
  }
}
