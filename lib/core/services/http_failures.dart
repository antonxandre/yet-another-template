import 'response.dart';

// Transformar em enchament enums.
// Criar Failure para models invalidas
class NotFoundFailure extends Failure {
  NotFoundFailure(String message) : super(message);
}

class BadRequestFailure extends Failure {
  BadRequestFailure(String message) : super(message);
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure(String message) : super(message);
}

class ServerErrorFailure extends Failure {
  ServerErrorFailure(String message) : super(message);
}

class ForbiddenFailure extends Failure {
  ForbiddenFailure(String message) : super(message);
}

class TimeoutFailure extends Failure {
  TimeoutFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  UnknownFailure(String message) : super(message);
}
