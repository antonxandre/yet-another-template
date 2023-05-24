import '../services/http_failures.dart';
import '../services/response.dart';

class HttpErrorUtil {
  static Failure handleFailure(int statusCode, {dynamic body}) {
    String? bodyMessage = body?['message'];
    switch (statusCode) {
      case 400:
        return throw BadRequestFailure(bodyMessage ?? 'Bad request');
      case 401:
        return throw UnauthorizedFailure(bodyMessage ?? 'Unauthorized');
      case 403:
        return throw ForbiddenFailure(bodyMessage ?? 'Forbidden');
      case 404:
        return throw NotFoundFailure(bodyMessage ?? 'Not found');
      case 500:
        return throw ServerErrorFailure(bodyMessage ?? 'Server error');
      case 504:
        return throw TimeoutFailure(bodyMessage ?? 'Gateway timeout');
      default:
        return throw UnknownFailure(bodyMessage ?? 'Unknown error');
    }
  }
}
