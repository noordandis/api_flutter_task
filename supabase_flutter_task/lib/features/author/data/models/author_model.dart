import '../../domain/entities/author.dart';

class AuthorModel extends Author {
  AuthorModel({required super.id, required super.name});

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(id: json['id'].toString(), name: json['name'] ?? '');
  }

  static List<AuthorModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => AuthorModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
