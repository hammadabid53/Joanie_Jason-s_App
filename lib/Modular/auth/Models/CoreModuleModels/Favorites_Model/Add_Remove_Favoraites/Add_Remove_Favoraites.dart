class AddRemoveFavoritesModel {
  final int? status;
  final String? message;

  AddRemoveFavoritesModel({
    this.status,
    this.message,
  });

  AddRemoveFavoritesModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'status': status, 'message': message};
}
