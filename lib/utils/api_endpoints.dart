class ApiEndPoints {
  static final String baseUrl = 'http://103.150.196.14:7001/api/v1/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static _BeternakEndPoints berternakEndpoints = _BeternakEndPoints();
}

class _AuthEndPoints {
  final String RegisterAccount = 'auth/register';
  final String LoginAccount = 'auth/login';
}

class _BeternakEndPoints {
  final String CategoriesBerternak = 'marketings/categorys/category1';
}
