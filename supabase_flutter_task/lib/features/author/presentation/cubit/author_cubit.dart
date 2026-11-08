import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:supabase_flutter_task/features/author/domain/usecases/add_author_usecase.dart';
import 'package:supabase_flutter_task/features/author/domain/usecases/get_author_usecase.dart';

import '../../domain/entities/author.dart';

part 'author_state.dart';

@injectable
class AuthorCubit extends Cubit<AuthorState> {
  final GetAuthorUseCase _getAuthorUseCase;
  final AddAuthorUseCase _addAuthorUseCase;
  AuthorCubit({
    required this._getAuthorUseCase,
    required this._addAuthorUseCase,
  }) : super(AuthorInitial());

  Future<void> loadAuthor() async {
    emit(AuthorLoading());

    final failureOrAuthors = await _getAuthorUseCase();
    failureOrAuthors.fold(
      (failure) => emit(AuthorFailure(errorMessage: failure.message)),
      (authors) => emit(AuthorLoaded(authorsList: authors)),
    );
  }

  Future<void> addAuthor(String name) async {
    emit(AuthorLoading());
    final failureOrAdd = await _addAuthorUseCase(name);
    failureOrAdd.fold(
      (failure) => emit(AuthorFailure(errorMessage: failure.message)),
      (_) async => await loadAuthor(),
    );
  }
}
