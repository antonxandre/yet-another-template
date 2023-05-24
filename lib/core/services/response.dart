sealed class Response {}

class Success<T> extends Response {
  Success(this.data);
  final T data;
}

class Failure extends Response {
  Failure(this.message);
  final String message;
}
