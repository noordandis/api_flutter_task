import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/addpost_services.dart';
import 'addpost_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());

  Future<void> addPost({required String title, required String body}) async {
    emit(AddPostLoading());
    try {
      await AddPostServices().addPost(title: title, body: body);
      emit(AddPostSuccess());
    } catch (e) {
      emit(AddPostFailure(errorMessage: e.toString()));
    }
  }
}
