class LogoutModel {
  final int? status;
  final String? message;

  LogoutModel({
    this.status,
    this.message,
  });

  LogoutModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}