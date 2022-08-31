class PastOrderModel {
  final int? status;
  final List<Orders>? orders;

  PastOrderModel({
    this.status,
    this.orders,
  });

  PastOrderModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        orders = (json['orders'] as List?)
            ?.map((dynamic e) => Orders.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'status': status, 'orders': orders?.map((e) => e.toJson()).toList()};
}

class Orders {
  final String? id;
  final String? userId;
  final List<Products>? products;
  final String? orderNumber;
  final double? orderPrice;
  final int? orderStatus;
  final int? cardNumber;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Orders({
    this.id,
    this.userId,
    this.products,
    this.orderNumber,
    this.orderPrice,
    this.orderStatus,
    this.cardNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Orders.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        userId = json['userId'] as String?,
        products = (json['products'] as List?)
            ?.map((dynamic e) => Products.fromJson(e as Map<String, dynamic>))
            .toList(),
        orderNumber = json['orderNumber'] as String?,
        orderPrice = json['orderPrice'] as double?,
        orderStatus = json['orderStatus'] as int?,
        cardNumber = json['cardNumber'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'products': products?.map((e) => e.toJson()).toList(),
        'orderNumber': orderNumber,
        'orderPrice': orderPrice,
        'orderStatus': orderStatus,
        'cardNumber': cardNumber,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class Products {
  final int? quantity;
  final Id? id;

  Products({
    this.quantity,
    this.id,
  });

  Products.fromJson(Map<String, dynamic> json)
      : quantity = json['quantity'] as int?,
        id = (json['_id'] as Map<String, dynamic>?) != null
            ? Id.fromJson(json['_id'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'quantity': quantity, '_id': id?.toJson()};
}

class Id {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? prodImage;

  Id({
    this.id,
    this.title,
    this.description,
    this.price,
    this.prodImage,
  });

  Id.fromJson(Map<String, dynamic> json)
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
