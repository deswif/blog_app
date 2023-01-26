enum AuthPageModel {
  login,
  register;

  String getTitle() {
    switch (this) {
      case AuthPageModel.login:
        return 'Login';
      case AuthPageModel.register:
        return 'Registration';
    }
  }

  String getDescription() {
    switch (this) {
      case AuthPageModel.login:
        return "Doesn't have an account? Create";
      case AuthPageModel.register:
        return 'Already have an account? Sign in';
    }
  }

  AuthPageModel opposite() {
    switch (this) {
      case AuthPageModel.login:
        return AuthPageModel.register;
      case AuthPageModel.register:
        return AuthPageModel.login;
    }
  }
}
