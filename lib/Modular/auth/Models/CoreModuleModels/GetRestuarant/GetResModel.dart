class GetResModel {
  final int? status;
  final List<Resturant>? resturant;

  GetResModel({
    this.status,
    this.resturant,
  });

  GetResModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        resturant = (json['resturant'] as List?)
            ?.map((dynamic e) => Resturant.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'resturant': resturant?.map((e) => e.toJson()).toList()
      };
}

class Resturant {
  final Location? location;
  final Timings? timings;
  final String? id;
  final String? userId;
  final String? resturantName;
  final String? resEmail;
  final int? resPhone;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Resturant({
    this.location,
    this.timings,
    this.id,
    this.userId,
    this.resturantName,
    this.resEmail,
    this.resPhone,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Resturant.fromJson(Map<String, dynamic> json)
      : location = (json['location'] as Map<String, dynamic>?) != null
            ? Location.fromJson(json['location'] as Map<String, dynamic>)
            : null,
        timings = (json['timings'] as Map<String, dynamic>?) != null
            ? Timings.fromJson(json['timings'] as Map<String, dynamic>)
            : null,
        id = json['_id'] as String?,
        userId = json['userId'] as String?,
        resturantName = json['resturantName'] as String?,
        resEmail = json['resEmail'] as String?,
        resPhone = json['resPhone'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'timings': timings?.toJson(),
        '_id': id,
        'userId': userId,
        'resturantName': resturantName,
        'resEmail': resEmail,
        'resPhone': resPhone,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class Location {
  final double? longitude;
  final double? latitude;

  Location({
    this.longitude,
    this.latitude,
  });

  Location.fromJson(Map<String, dynamic> json)
      : longitude = json['longitude'] as double,
        latitude = json['latitude'] as double;

  Map<String, dynamic> toJson() =>
      {'longitude': longitude, 'latitude': latitude};
}

class Timings {
  final Monday? monday;
  final Tuesday? tuesday;
  final Wednesday? wednesday;
  final Thursday? thursday;
  final Friday? friday;

  Timings({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
  });

  Timings.fromJson(Map<String, dynamic> json)
      : monday = (json['monday'] as Map<String, dynamic>?) != null
            ? Monday.fromJson(json['monday'] as Map<String, dynamic>)
            : null,
        tuesday = (json['tuesday'] as Map<String, dynamic>?) != null
            ? Tuesday.fromJson(json['tuesday'] as Map<String, dynamic>)
            : null,
        wednesday = (json['wednesday'] as Map<String, dynamic>?) != null
            ? Wednesday.fromJson(json['wednesday'] as Map<String, dynamic>)
            : null,
        thursday = (json['thursday'] as Map<String, dynamic>?) != null
            ? Thursday.fromJson(json['thursday'] as Map<String, dynamic>)
            : null,
        friday = (json['friday'] as Map<String, dynamic>?) != null
            ? Friday.fromJson(json['friday'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'monday': monday?.toJson(),
        'tuesday': tuesday?.toJson(),
        'wednesday': wednesday?.toJson(),
        'thursday': thursday?.toJson(),
        'friday': friday?.toJson()
      };
}

class Monday {
  final String? mOpenTime;
  final String? mCloseTime;

  Monday({
    this.mOpenTime,
    this.mCloseTime,
  });

  Monday.fromJson(Map<String, dynamic> json)
      : mOpenTime = json['M_openTime'] as String?,
        mCloseTime = json['M_closeTime'] as String?;

  Map<String, dynamic> toJson() =>
      {'M_openTime': mOpenTime, 'M_closeTime': mCloseTime};
}

class Tuesday {
  final String? tOpenTime;
  final String? tCloseTime;

  Tuesday({
    this.tOpenTime,
    this.tCloseTime,
  });

  Tuesday.fromJson(Map<String, dynamic> json)
      : tOpenTime = json['T_openTime'] as String?,
        tCloseTime = json['T_closeTime'] as String?;

  Map<String, dynamic> toJson() =>
      {'T_openTime': tOpenTime, 'T_closeTime': tCloseTime};
}

class Wednesday {
  final String? wOpenTime;
  final String? wCloseTime;

  Wednesday({
    this.wOpenTime,
    this.wCloseTime,
  });

  Wednesday.fromJson(Map<String, dynamic> json)
      : wOpenTime = json['W_openTime'] as String?,
        wCloseTime = json['W_closeTime'] as String?;

  Map<String, dynamic> toJson() =>
      {'W_openTime': wOpenTime, 'W_closeTime': wCloseTime};
}

class Thursday {
  final String? tHOpenTime;
  final String? tHCloseTime;

  Thursday({
    this.tHOpenTime,
    this.tHCloseTime,
  });

  Thursday.fromJson(Map<String, dynamic> json)
      : tHOpenTime = json['TH_openTime'] as String?,
        tHCloseTime = json['TH_closeTime'] as String?;

  Map<String, dynamic> toJson() =>
      {'TH_openTime': tHOpenTime, 'TH_closeTime': tHCloseTime};
}

class Friday {
  final String? fOpenTime;
  final String? fCloseTime;

  Friday({
    this.fOpenTime,
    this.fCloseTime,
  });

  Friday.fromJson(Map<String, dynamic> json)
      : fOpenTime = json['F_openTime'] as String?,
        fCloseTime = json['F_closeTime'] as String?;

  Map<String, dynamic> toJson() =>
      {'F_openTime': fOpenTime, 'F_closeTime': fCloseTime};
}
