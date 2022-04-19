import 'package:testapp/services/application_service.dart';

import '../services/api_services.dart';
import 'http_service.dart';

class ServiceLocator {
  static HttpService? _httpService;
  static ApplicationService? _applicationService;

  static final ServiceLocator _singleton = ServiceLocator._internal();

  factory ServiceLocator() => _singleton;

  ServiceLocator._internal();

  static ApiServices getApiService() {
    _httpService ??= HttpService();
    return _httpService!;
  }

  static ApplicationService getApplicationService() {
    _applicationService ??= ApplicationService();
    return _applicationService!;
  }
}
