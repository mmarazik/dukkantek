abstract class ApiException implements Exception {
  final String _message;

  String get message => _message;

  ApiException(this._message);
}
