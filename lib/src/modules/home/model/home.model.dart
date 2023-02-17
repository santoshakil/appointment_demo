import 'package:isar/isar.dart';

part 'home.model.g.dart';

@collection
class Appointment {
  Id? id;
  String name;
  DateTime datetime;
  String toWhom;
  String? description;
  bool isDone;

  Appointment({
    this.id,
    required this.name,
    required this.datetime,
    required this.toWhom,
    this.description,
    required this.isDone,
  });

  Appointment copyWith({
    Id? id,
    String? name,
    DateTime? datetime,
    String? toWhom,
    String? description,
    bool? isDone,
  }) {
    return Appointment(
      id: id ?? this.id,
      name: name ?? this.name,
      datetime: datetime ?? this.datetime,
      toWhom: toWhom ?? this.toWhom,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Appointment && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
