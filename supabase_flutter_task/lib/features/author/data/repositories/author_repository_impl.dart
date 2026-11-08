import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/author.dart';
import '../../domain/repositories/author_repositories.dart';
import '../datasourses/author_remote_data_source.dart';

@LazySingleton(as: AuthorRepositories)
class AuthorRepositoryImpl implements AuthorRepositories {
  final AuthorRemoteDataSource remoteDataSource;

  AuthorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Author>>> getAllAuthor() async {
    try {
      final remoteAuthor = await remoteDataSource.getAllAuthor();

      return Right(remoteAuthor.cast<Author>());
    } on DioException catch (e) {
      return left(ServerFailure(message: e.message ?? 'Unknown Error'));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addAuthor(String name) async {
    try {
      return Right(remoteDataSource.addAuthor(name));
    } on DioException catch (e) {
      return left(ServerFailure(message: e.message ?? 'Unknown Error'));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
