class Change_password_Model {
  final int? status;
  final String? message;

 Change_password_Model({
    this.status,
    this.message,
  });

 Change_password_Model.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}