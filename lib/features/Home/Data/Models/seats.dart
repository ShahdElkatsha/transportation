


import 'buses.dart';

class Seat {
  final String seatId;
  final int seatNum;
  final bool isAvailable;
  final String busId;
  final Bus bus;

  Seat({
    required this.seatId,
    required this.seatNum,
    required this.isAvailable,
    required this.busId,
    required this.bus,
  });

  factory Seat.fromJson(Map<String, dynamic> json) {
    return Seat(
      seatId: json['seatId'],
      seatNum: json['seatNum'],
      isAvailable: json['isAvailable'],
      busId: json['busId'],
      bus: Bus.fromJson(json['bus']),
    );
  }
}
