import 'package:api_flutter_task/helper/api.dart';
import 'package:api_flutter_task/models/post_model.dart';

class AllPostServices {
  Future<List<PostModel>> getAllPost() async {
    List<dynamic> data = await Api().get(url: "https://jsonplaceholder.typicode.com/posts");
    List<PostModel> postList = [];
    for (int i = 0; i < data.length; i++) {
      postList.add(PostModel.fromJson(data[i]));
    }
    return postList;
  }
}
