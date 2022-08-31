class FavoritesModel {
  final int? status;
  final String? message;
  final List<Favourites>? favourites;

  FavoritesModel({
    this.status,
    this.message,
    this.favourites,
  });

  FavoritesModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        favourites = (json['favourites'] as List?)
            ?.map((dynamic e) => Favourites.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'favourites': favourites?.map((e) => e.toJson()).toList()
      };
}

class Favourites {
  final String? id;
  final String? userId;
  final ProductId? productId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Favourites({
    this.id,
    this.userId,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Favourites.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        userId = json['userId'] as String?,
        productId = (json['productId'] as Map<String, dynamic>?) != null
            ? ProductId.fromJson(json['productId'] as Map<String, dynamic>)
            : null,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'productId': productId?.toJson(),
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class ProductId {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? prodImage;

  ProductId({
    this.id,
    this.title,
    this.description,
    this.price,
    this.prodImage,
  });

  ProductId.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        price = json['price'] as double?,
        prodImage = json['prod_image'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'description': description,
        'price': price,
        'prod_image': prodImage
      };
}
