

class Bus {
  final String id;
  final int numberOfSeats;
  final List<String> seats;
  final bool isAvailable;

  Bus({
    required this.id,
    required this.numberOfSeats,
    required this.seats,
    required this.isAvailable,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    var seatList = json['seats'] as List;
    List<String> seatsList = seatList.map((seat) => seat.toString()).toList();
    return Bus(
      id: json['id'],
      numberOfSeats: json['numberOfSeats'],
      seats: seatsList,
      isAvailable: json['isAvailable'],
    );
  }
}
