import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/author.dart';

abstract class AuthorRepositories {
  Future<Either<Failure, List<Author>>> getAllAuthor();
  Future<Either<Failure, void>> addAuthor(String name);
}
