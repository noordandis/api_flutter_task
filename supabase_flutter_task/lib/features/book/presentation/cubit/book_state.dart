import '../../domain/entities/book.dart';

abstract class BookState {}

final class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Book> booksList;
  BookLoaded({required this.booksList});
}

class BookFailure extends BookState {
  final String errorMessage;

  BookFailure({required this.errorMessage});
}
