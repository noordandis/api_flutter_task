import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../repositories/book_repositories.dart';

@injectable
class AddBookUseCase {
  final BookRepositories repository;

  AddBookUseCase({required this.repository});

  Future<Either<Failure, void>> call(
    String title,
    int publishedYear,
    String authorId,
  ) async {
    return await repository.addBook(title, publishedYear, authorId);
  }
}
