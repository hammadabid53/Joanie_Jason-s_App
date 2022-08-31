class GetSubCategoriesModel {
  final int? status;
  final List<Category>? category;

  GetSubCategoriesModel({
    this.status,
    this.category,
  });

  GetSubCategoriesModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        category = (json['category'] as List?)
            ?.map((dynamic e) => Category.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'status': status, 'category': category?.map((e) => e.toJson()).toList()};
}

class Category {
  final String? id;
  final String? title;
  final String? catImage;
  final String? parentId;
  final String? resturantId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Category({
    this.id,
    this.title,
    this.catImage,
    this.parentId,
    this.resturantId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Category.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        title = json['title'] as String?,
        catImage = json['cat_image'] as String?,
        parentId = json['parentId'] as String?,
        resturantId = json['resturantId'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'cat_image': catImage,
        'parentId': parentId,
        'resturantId': resturantId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}
