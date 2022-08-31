class PolicyModel {
  PolicyModel({
    required this.status,
    required this.message,
  });
  late final int status;
  late final List<Message> message;

  PolicyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
        List.from(json['message']).map((e) => Message.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Message {
  Message({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.V,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String title;
  late final String content;
  late final String type;
  late final int V;
  late final String createdAt;
  late final String updatedAt;

  Message.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    content = json['content'];
    type = json['type'];
    V = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['content'] = content;
    _data['type'] = type;
    _data['__v'] = V;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
