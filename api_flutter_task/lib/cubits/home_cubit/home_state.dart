

import '../../models/post_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<PostModel> post;
  HomeSuccess({required this.post});
}

class HomeFailure extends HomeState {
  final String errorMessage;
  HomeFailure({required this.errorMessage});
}