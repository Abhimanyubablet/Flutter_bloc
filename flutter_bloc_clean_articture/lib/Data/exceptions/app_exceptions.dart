class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix: $_message";
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, "No Internet Connection");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, "You dont have access to this");
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message]) : super(message, "Request Time Out");
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "");
}


