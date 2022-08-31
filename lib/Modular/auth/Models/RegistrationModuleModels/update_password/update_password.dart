class UpdatePasswordModel {
  final int? status;
  final String? message;

  UpdatePasswordModel({
    this.status,
    this.message,
  });

  UpdatePasswordModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}