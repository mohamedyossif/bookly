import 'package:bookly_app/Core/Error/failure.dart';
import 'package:bookly_app/Features/Home/Data/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BookModel>>> fetchHomeBooks(
      {required String content});
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String content});
}
