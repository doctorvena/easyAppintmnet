import 'package:json_annotation/json_annotation.dart';

part 'salon.g.dart';

@JsonSerializable()
class Salon {
  Salon(
    this.salonId,
    this.salonName,
    this.address,
    this.photo,
    this.ownerUserId,
    this.cityId,
  );

  int? salonId;
  String? salonName;
  String? address;
  String? photo;
  int? ownerUserId;
  int? cityId;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Salon.fromJson(Map<String, dynamic> json) => _$SalonFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.

  Map<String, dynamic> toJson() => _$SalonToJson(this);
}
