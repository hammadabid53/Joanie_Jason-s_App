class GetResModel {
  final int? status;
  final List<Resturant>? resturant;

  GetResModel({
    this.status,
    this.resturant,
  });

  GetResModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      resturant = (json['resturant'] as List?)?.map((dynamic e) => Resturant.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'resturant' : resturant?.map((e) => e.toJson()).toList()
  };
}

class Resturant {
  final String? id;
  final String? resturantName;

  Resturant({
    this.id,
    this.resturantName,
  });

  Resturant.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      resturantName = json['resturantName'] as String?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'resturantName' : resturantName
  };
}