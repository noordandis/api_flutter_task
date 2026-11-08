import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/book.dart';

abstract class BookRepositories {
  Future<Either<Failure, List<Book>>> getAllBook();
  Future<Either<Failure, void>> addBook(
    String title,
    int publisherYear,
    String authorId,
  );
}
