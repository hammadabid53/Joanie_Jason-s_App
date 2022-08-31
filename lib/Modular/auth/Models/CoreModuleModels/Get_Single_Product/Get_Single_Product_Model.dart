class GetSingleProductDetailsModel {
  final int? status;
  final List<Product>? product;

  GetSingleProductDetailsModel({
    this.status,
    this.product,
  });

  GetSingleProductDetailsModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        product = (json['product'] as List?)
            ?.map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'status': status, 'product': product?.map((e) => e.toJson()).toList()};
}

class Product {
  final String? id;
  final String? title;
  final String? description;
   double? price;
  final String? prodImage;
  final String? catId;
  final String? createdAt;
  final String? updatedAt;
 int? quantity;
  final int? v;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.prodImage,
    this.catId,
    this.createdAt,
    this.updatedAt,
    this.quantity,
    this.v,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        price = json['price'] as double?,
        prodImage = json['prod_image'] as String?,
        catId = json['catId'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        quantity = json['quantity'] as int?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'description': description,
        'price': price,
        'prod_image': prodImage,
        'catId': catId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'quantity': quantity,
        '__v': v
      };
}
