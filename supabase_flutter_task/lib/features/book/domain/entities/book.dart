class Book {
  final String id;
  final String title;
  final int publishedYear;
  final String authorId;
  final String? authorName;

  Book({
    required this.id,
    required this.title,
    required this.publishedYear,
    required this.authorId,
    this.authorName,
  });
}
