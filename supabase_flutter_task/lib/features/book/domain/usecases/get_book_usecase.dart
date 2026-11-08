import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/book.dart';
import '../repositories/book_repositories.dart';

@injectable
class GetBookUseCase {
  final BookRepositories repository;

  GetBookUseCase({required this.repository});

  Future<Either<Failure, List<Book>>> call() async {
    return await repository.getAllBook();
  }
}
