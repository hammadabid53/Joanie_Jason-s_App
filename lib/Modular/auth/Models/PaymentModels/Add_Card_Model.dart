class AddCardModel {
  final int? status;
  final String? message;

  AddCardModel({
    this.status,
    this.message,
  });

  AddCardModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}