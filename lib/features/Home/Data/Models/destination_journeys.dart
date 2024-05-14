import 'package:transportation/features/Home/Data/Models/seats.dart';


class DestinationPoint {
  final String id;
  final double ticketPrice;
  final String destinationId;
  final String startBusStopId;
  final DateTime leavingTime;
  final DateTime arrivalTime;
  final String busId;
  final String journeyId;
  final int numberOfAvailableTickets;
  final String destinationName;
  final String startBusStopName;
  final List<Seat> seats;

  DestinationPoint({
    required this.id,
    required this.ticketPrice,
    required this.destinationId,
    required this.startBusStopId,
    required this.leavingTime,
    required this.arrivalTime,
    required this.busId,
    required this.journeyId,
    required this.numberOfAvailableTickets,
    required this.destinationName,
    required this.startBusStopName,
    required this.seats,
  });

  factory DestinationPoint.fromJson(Map<String, dynamic> json) {
    var seatList = json['seats'] as List;
    List<Seat> seatsList = seatList.map((seat) => Seat.fromJson(seat)).toList();
    return DestinationPoint(
      id: json['id'],
      ticketPrice: json['ticketPrice'],
      destinationId: json['destinationId'],
      startBusStopId: json['startBusStopId'],
      leavingTime: DateTime.parse(json['leavingTime']),
      arrivalTime: DateTime.parse(json['arrivalTime']),
      busId: json['busId'],
      journeyId: json['journeyId'],
      numberOfAvailableTickets: json['numberOfAvailableTickets'],
      destinationName: json['destinationName'],
      startBusStopName: json['startBusStopName'],
      seats: seatsList,
    );
  }
}
