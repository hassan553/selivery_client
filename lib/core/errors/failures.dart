import 'package:dio/dio.dart';

class ServerFailure {
  static String serverFailure(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout with ApiServer';

      case DioExceptionType.sendTimeout:
        return 'Send timeout with ApiServer';

      case DioExceptionType.receiveTimeout:
        return 'Receive timeout with ApiServer';

      case DioExceptionType.badResponse:
        return _serverFailure(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return 'Request to ApiServer was canceld';

      default:
        if (dioError.message!.contains('SocketException')) {
          return 'No Internet Connection';
        }
        return 'Unexpected Error, Please try again!';
    }
  }
}

_serverFailure(int? statusCode, dynamic response) {
  if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
    return response['message'];
  } else if (statusCode == 404) {
    return 'Your request not found, Please try later!';
  } else if (statusCode == 500) {
    return 'Internal Server error, Please try later';
  } else {
    return 'Opps There was an Error, Please try again';
  }
}
