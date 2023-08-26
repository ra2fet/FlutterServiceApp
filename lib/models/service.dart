import 'package:meta/meta.dart';

class Datum {
  Datum({
    @required this.id,
    @required this.image,
    @required this.slug,
    @required this.categoryId,
    @required this.status,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.type,
    @required this.name,
    @required this.description,
    @required this.categories,
  });

  final int id;
  final String image;
  final String slug;
  final String categoryId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String type;
  final String name;
  final String description;
  final List<Datum> categories;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        slug: json["slug"],
        categoryId: json["category_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        type: json["type"],
        name: json["name"],
        description: json["description"],
        categories:
            List<Datum>.from(json["categories"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "slug": slug,
        "category_id": categoryId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "type": type,
        "name": name,
        "description": description,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}
