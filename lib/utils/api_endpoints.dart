class ApiEndPoints {
  static final String baseUrl = 'https://reqres.in/api/v1/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'auth/register';
  final String loginEmail = 'auth/login';
}
