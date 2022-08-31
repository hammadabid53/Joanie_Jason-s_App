class ResendOtpModel {
  final int? status;
  final String? message;

  ResendOtpModel({
    this.status,
    this.message,
  });

  ResendOtpModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}