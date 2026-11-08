import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../repositories/author_repositories.dart';

@injectable
class AddAuthorUseCase {
  final AuthorRepositories repository;

  AddAuthorUseCase({required this.repository});

  Future<Either<Failure, void>> call(String name) async {
    return await repository.addAuthor(name);
  }
}
