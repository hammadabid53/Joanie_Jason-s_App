class LoginUserModel {
  final int? status;
  final String? message;
  final Data? data;

  LoginUserModel({
    this.status,
    this.message,
    this.data,
  });

  LoginUserModel.fromJson(Map<String, dynamic> json)
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
  final String? id;
  final String? userName;
  final String? email;
  final String? password;
  final int? phoneNumber;
  final dynamic image;
  final int? verificationCode;
  final int? isVerified;
  final String? role;
  final int? isBlocked;
  final String? userAuthentication;
  final dynamic userSocialToken;
  final dynamic userSocialType;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Data({
    this.id,
    this.userName,
    this.email,
    this.password,
    this.phoneNumber,
    this.image,
    this.verificationCode,
    this.isVerified,
    this.role,
    this.isBlocked,
    this.userAuthentication,
    this.userSocialToken,
    this.userSocialType,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      userName = json['user_name'] as String?,
      email = json['email'] as String?,
      password = json['password'] as String?,
      phoneNumber = json['phone_number'] as int?,
      image = json['image'],
      verificationCode = json['verification_code'] as int?,
      isVerified = json['is_verified'] as int?,
      role = json['role'] as String?,
      isBlocked = json['is_blocked'] as int?,
      userAuthentication = json['user_authentication'] as String?,
      userSocialToken = json['user_social_token'],
      userSocialType = json['user_social_type'],
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'user_name' : userName,
    'email' : email,
    'password' : password,
    'phone_number' : phoneNumber,
    'image' : image,
    'verification_code' : verificationCode,
    'is_verified' : isVerified,
    'role' : role,
    'is_blocked' : isBlocked,
    'user_authentication' : userAuthentication,
    'user_social_token' : userSocialToken,
    'user_social_type' : userSocialType,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}