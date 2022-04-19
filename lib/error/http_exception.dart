import 'api_exception.dart';

class HttpException extends ApiException {
  final dynamic _error;

  dynamic get error => _error;

  HttpException(String message, this._error) : super(message);
}
