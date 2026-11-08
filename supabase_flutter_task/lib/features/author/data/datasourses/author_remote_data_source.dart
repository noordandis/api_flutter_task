import 'package:injectable/injectable.dart';
import 'package:supabase/supabase.dart';

import '../models/author_model.dart';

@injectable
class AuthorRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthorRemoteDataSource({required this.supabaseClient});

  Future<List<AuthorModel>> getAllAuthor() async {
    final response = await supabaseClient.from('authors').select();
    return (response as List).map((e) => AuthorModel.fromJson(e)).toList();
  }

  Future<void> addAuthor(String name) async {
    await supabaseClient.from('authors').insert({'name': name});
  }
}
