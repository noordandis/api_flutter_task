part of 'author_cubit.dart';

abstract class AuthorState {}

final class AuthorInitial extends AuthorState {}

class AuthorLoading extends AuthorState {}

class AuthorLoaded extends AuthorState {
  final List<Author> authorsList;
  AuthorLoaded({required this.authorsList});
}

class AuthorFailure extends AuthorState {
  final String errorMessage;

  AuthorFailure({required this.errorMessage});
}
