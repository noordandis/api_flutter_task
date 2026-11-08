import 'package:api_flutter_task/models/post_model.dart';

import '../helper/api.dart';

class AddPostServices {
  Future<PostModel> addPost({
    required String title,
    required String body,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: "https://jsonplaceholder.typicode.com/posts",
      body: {"title": title, "body": body},
    );
    return PostModel.fromJson(data);
  }
}
