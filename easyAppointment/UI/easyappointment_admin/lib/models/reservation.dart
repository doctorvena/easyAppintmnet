import 'package:eprodaja_admin/models/time-slot.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'reservation.g.dart';

@JsonSerializable()
class Reservation {
  Reservation(
    this.reservationId,
    this.salonId,
    this.userCustomerId,
    this.timeSlotId,
    this.reservationDate,
    this.reservationName,
    this.timeSlots,
  );

  int? reservationId;
  int? salonId;
  int? userCustomerId;
  int? timeSlotId;
  DateTime? reservationDate;
  String? reservationName;
  @JsonKey(name: 'timeslots')
  List<TimeSlot>? timeSlots;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  // factory Reservation.fromJson(Map<String, dynamic> json) =>
  //     _$ReservationFromJson(json);
  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ReservationToJson(this);
}
