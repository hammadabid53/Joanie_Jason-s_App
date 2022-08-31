class DefaultCardModel {
  final int? status;
  final String? message;

  DefaultCardModel({
    this.status,
    this.message,
  });

  DefaultCardModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}