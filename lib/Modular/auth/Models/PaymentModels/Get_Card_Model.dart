class GetCardModel {
  final int? status;
  final String? message;
  final List<Data>? data;

  GetCardModel({
    this.status,
    this.message,
    this.data,
  });

  GetCardModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList()
      };
}

class Data {
  final String? id;
  final String? userId;
  final int? cardNumber;
  final int? expMonth;
  final int? expYear;
  final int? cvv;
  final String? stripeToken;
  final int? isActive;
  final int? isBlocked;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Data({
    this.id,
    this.userId,
    this.cardNumber,
    this.expMonth,
    this.expYear,
    this.cvv,
    this.stripeToken,
    this.isActive,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        userId = json['userId'] as String?,
        cardNumber = json['cardNumber'] as int?,
        expMonth = json['exp_month'] as int?,
        expYear = json['exp_year'] as int?,
        cvv = json['cvv'] as int?,
        stripeToken = json['stripe_token'] as String?,
        isActive = json['is_active'] as int?,
        isBlocked = json['is_blocked'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'cardNumber': cardNumber,
        'exp_month': expMonth,
        'exp_year': expYear,
        'cvv': cvv,
        'stripe_token': stripeToken,
        'is_active': isActive,
        'is_blocked': isBlocked,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}
