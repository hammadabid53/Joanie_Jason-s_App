class ForgetPasswordModel {
  final int? status;
  final String? message;
  final Data? data;

  ForgetPasswordModel({
    this.status,
    this.message,
    this.data,
  });

  ForgetPasswordModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final String? userId;

  Data({
    this.userId,
  });

  Data.fromJson(Map<String, dynamic> json)
    : userId = json['user_id'] as String?;

  Map<String, dynamic> toJson() => {
    'user_id' : userId
  };
}