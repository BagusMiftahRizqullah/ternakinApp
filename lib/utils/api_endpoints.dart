class ApiEndPoints {
  static final String baseUrl = 'http://103.150.196.14:7001/api/v1/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String RegisterAccount = 'auth/register';
  final String LoginAccount = 'auth/login';
}
