import 'dart:io';

import 'package:bookly_app/Core/Error/failure.dart';
import 'package:bookly_app/Core/Utilities/api_service.dart';
import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl._private(this._apiService);

  static HomeRepositoryImpl? _instance;
  final ApiService _apiService;
  factory HomeRepositoryImpl() {
    return _instance ??= HomeRepositoryImpl._private(ApiService());
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchHomeBooks(
      {required String content}) async {
    try {
      //get data from Api
      Response response = await _apiService.get(
          endPoint: 'volumes?Filtering=full&q=$content&orderby=newest');
      //convert to list of bookModel
      List<BookModel> books = [];
      for (Map<String, dynamic> book in response.data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
      //Catch all Exception
    } on DioException catch (error) {
      if (error is SocketException) {
        return left(ServerFailure('No Internet Connection'));
      } else if (error.response != null) {
        return left(
          ServerFailure.fromRespone(error.response!),
        );
      }
      return left(ServerFailure.dioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String content}) async {
    try {
      //get data from Api
      Response response = await _apiService.get(
          endPoint: 'volumes?Filtering=full&q=$content&orderby=relevance');
      //convert to list of bookModel
      List<BookModel> books = [];
      for (Map<String, dynamic> book in response.data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
      //Catch all Exception
    } on DioException catch (error) {
      if (error is SocketException) {
        return left(ServerFailure('No Internet Connection'));
      } else if (error.response != null) {
        return left(
          ServerFailure.fromRespone(error.response!),
        );
      }
      return left(ServerFailure.dioError(error));
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
