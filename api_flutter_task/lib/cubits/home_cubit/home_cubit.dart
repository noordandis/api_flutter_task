import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/api.dart';
import '../../models/post_model.dart';
import '../../services/get_all_posts_services.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<PostModel> postsList = [];
  Future<void> getAllPost() async {
    emit(HomeLoading());
    try {
      postsList = await AllPostServices().getAllPost();
      emit(HomeSuccess(post: postsList));
    } catch (e) {
      emit(HomeFailure(errorMessage: e.toString()));
    }
  }

  Future<void> deletePost({required int id}) async {
    try {
      await Api().delete(url: 'https://jsonplaceholder.typicode.com/posts/$id');
      postsList.removeWhere((item) => item.id == id);

      emit(HomeSuccess(post: List.from(postsList)));
    } catch (e) {
      emit(HomeFailure(errorMessage: e.toString()));
    }
  }
}
