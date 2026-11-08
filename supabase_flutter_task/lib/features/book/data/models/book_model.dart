import '../../domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    required super.id,
    required super.title,
    required super.publishedYear,
    required super.authorId,
    super.authorName,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      publishedYear: json['published_year'] ?? 0,
      authorId: json['author_id'] ?? '',
      authorName: json['authors'] != null ? json['authors']['name'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'published_year': publishedYear,
      'author_id': authorId,
    };
  }

  static List<BookModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => BookModel.fromJson(json)).toList();
  }
}
