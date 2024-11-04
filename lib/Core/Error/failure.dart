import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  final int counter = 0;
  ServerFailure(super.errorMessage);
  factory ServerFailure.dioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout, Please try again later');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout , Please try again later');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout , Please try again later');
      case DioExceptionType.badCertificate:
        return ServerFailure('The certificate of the response is not approved');
      case DioExceptionType.badResponse:
        return ServerFailure('bad response');
      case DioExceptionType.cancel:
        return ServerFailure('The request was manually cancelled by the user');
      case DioExceptionType.connectionError:
        return ServerFailure(
            'No internet connection. Please check your network settings');
      case DioExceptionType.unknown:
        return ServerFailure('Unknown error occured. Please try again later');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromRespone(Response<dynamic> respone) {
    if (respone.statusCode == 400 ||
        respone.statusCode == 401 ||
        respone.statusCode == 403) {
      return ServerFailure(respone.data['error']['message']);
    } else if (respone.statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (respone.statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
