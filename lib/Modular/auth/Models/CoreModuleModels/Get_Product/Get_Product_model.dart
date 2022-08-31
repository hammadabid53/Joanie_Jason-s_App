class GetProductModel {
  final int? status;
  final List<Data>? data;

  GetProductModel({
    this.status,
    this.data,
  });

  GetProductModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? prodImage;
  final String? catId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final List<dynamic>? favourite;

  Data({
    this.id,
    this.title,
    this.description,
    this.price,
    this.prodImage,
    this.catId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.favourite,
  });

  Data.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      title = json['title'] as String?,
      description = json['description'] as String?,
      price = json['price'] as double?,
      prodImage = json['prod_image'] as String?,
      catId = json['catId'] as String?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?,
      favourite = json['favourite'] as List?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'title' : title,
    'description' : description,
    'price' : price,
    'prod_image' : prodImage,
    'catId' : catId,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v,
    'favourite' : favourite
  };
}