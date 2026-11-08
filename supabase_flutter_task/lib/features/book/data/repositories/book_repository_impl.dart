import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/book.dart';
import '../../domain/repositories/book_repositories.dart';
import '../datasourses/book_remote_data_source.dart';

@LazySingleton(as: BookRepositories)
class BookRepositoryImpl implements BookRepositories {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Book>>> getAllBook() async {
    try {
      final remoteBook = await remoteDataSource.getAllBooks();

      return Right(remoteBook.cast<Book>());
    } on DioException catch (e) {
      return left(ServerFailure(message: e.message ?? 'Unknown Error'));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addBook(
    String title,
    int publishedYear,
    String authorId,
  ) async {
    try {
      await remoteDataSource.addBook(
        title: title,
        publishedYear: publishedYear,
        authorId: authorId,
      );
      return const Right(null);
    } on DioException catch (e) {
      return left(ServerFailure(message: e.message ?? 'Unknown Error'));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
