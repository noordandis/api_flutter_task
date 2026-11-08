import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:supabase_flutter_task/features/book/domain/usecases/add_book_usecase.dart';
import 'package:supabase_flutter_task/features/book/domain/usecases/get_book_usecase.dart';

import 'book_state.dart';

@injectable
class BookCubit extends Cubit<BookState> {
  final GetBookUseCase _getBookUseCase;
  final AddBookUseCase _addBookUseCase;

  BookCubit({required this._getBookUseCase, required this._addBookUseCase})
    : super(BookLoading());

  Future<void> loadBook() async {
    emit(BookLoading());

    final failureOrBooks = await _getBookUseCase();
    failureOrBooks.fold(
      (failure) => emit(BookFailure(errorMessage: failure.toString())),
      (books) => emit(BookLoaded(booksList: books)),
    );
  }

  Future<void> addBook(String title, int publishedYear, String authorId) async {
    emit(BookLoading());
    final failureOrAdd = await _addBookUseCase(title, publishedYear, authorId);
    failureOrAdd.fold(
      (failure) => emit(BookFailure(errorMessage: failure.message)),
      (_) async => await loadBook(),
    );
  }
}
