import 'package:injectable/injectable.dart';
import 'package:supabase/supabase.dart';

import '../models/book_model.dart';

@injectable
class BookRemoteDataSource {
  final SupabaseClient supabaseClient;
  BookRemoteDataSource({required this.supabaseClient});

  Future<List<BookModel>> getAllBooks() async {
    final response = await supabaseClient
        .from('books')
        .select('*, authors(name)');

    return (response as List).map((e) => BookModel.fromJson(e)).toList();
  }

  Future<void> addBook({
    required String title,
    required int publishedYear,
    required String authorId,
  }) async {
    await supabaseClient.from('books').insert({
      'title': title,
      'published_year': publishedYear,
      'author_id': authorId,
    });
  }
}
