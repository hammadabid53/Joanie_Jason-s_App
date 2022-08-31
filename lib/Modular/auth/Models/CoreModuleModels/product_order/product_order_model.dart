class ProductOrderModel {
  final int? status;
  final String? message;
  final Order? order;

  ProductOrderModel({
    this.status,
    this.message,
    this.order,
  });

  ProductOrderModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        order = (json['order'] as Map<String, dynamic>?) != null
            ? Order.fromJson(json['order'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'order': order?.toJson()};
}

class Order {
  final String? userId;
  final List<Products>? products;
  final String? orderNumber;
  final double? orderPrice;
  final int? orderStatus;
  // final int? cardNumber;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Order({
    this.userId,
    this.products,
    this.orderNumber,
    this.orderPrice,
    this.orderStatus,
    // this.cardNumber,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Order.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] as String?,
        products = (json['products'] as List?)
            ?.map((dynamic e) => Products.fromJson(e as Map<String, dynamic>))
            .toList(),
        orderNumber = json['orderNumber'] as String?,
        orderPrice = json['orderPrice'] as double?,
        orderStatus = json['orderStatus'] as int?,
        // cardNumber = json['cardNumber'] as int?,
        id = json['_id'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'products': products?.map((e) => e.toJson()).toList(),
        'orderNumber': orderNumber,
        'orderPrice': orderPrice,
        'orderStatus': orderStatus,
        // 'cardNumber' : cardNumber,
        '_id': id,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class Products {
  final String? productId;
  final int? quantity;
  final String? id;

  Products({
    this.productId,
    this.quantity,
    this.id,
  });

  Products.fromJson(Map<String, dynamic> json)
      : productId = json['productId'] as String?,
        quantity = json['quantity'] as int?,
        id = json['_id'] as String?;

  Map<String, dynamic> toJson() =>
      {'productId': productId, 'quantity': quantity, '_id': id};
}
