import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DateEntity extends Equatable {
  String day;
  String month;
  String year;

  DateEntity({required this.day, required this.month, required this.year});

  @override
  // TODO: implement props
  List<Object?> get props => [
        day,
        month,
        year,
      ];
}
