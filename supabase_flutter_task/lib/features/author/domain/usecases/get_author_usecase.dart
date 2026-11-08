import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/author.dart';
import '../repositories/author_repositories.dart';

@injectable
class GetAuthorUseCase {
  final AuthorRepositories repository;

  GetAuthorUseCase({required this.repository});

  Future<Either<Failure, List<Author>>> call() async {
    return await repository.getAllAuthor();
  }
}
