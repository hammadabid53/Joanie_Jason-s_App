class DeleteCardModel {
  final int? status;
  final String? message;

  DeleteCardModel({
    this.status,
    this.message,
  });

  DeleteCardModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}