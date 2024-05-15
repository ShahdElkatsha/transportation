class TransportData  {
  String? message;
  int? statusCode;
  List<StartDestinationJourney>? startDestinationJourney;

  TransportData ({this.message, this.statusCode, this.startDestinationJourney});

  TransportData .fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['startDestinationJourney'] != null) {
      startDestinationJourney = <StartDestinationJourney>[];
      json['startDestinationJourney'].forEach((v) {
        startDestinationJourney!.add(new StartDestinationJourney.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    if (this.startDestinationJourney != null) {
      data['startDestinationJourney'] =
          this.startDestinationJourney!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StartDestinationJourney {
  String? id;
  int? ticketPrice;
  String? destinationId;
  String? startBusStopId;
  String? leavingTime;
  String? arrivalTime;
  String? busId;
  String? journeyId;
  int? numberOfAvailableTickets;
  String? destinationName;
  String? startBusStopName;
  List<Seats>? seats;

  StartDestinationJourney(
      {this.id,
        this.ticketPrice,
        this.destinationId,
        this.startBusStopId,
        this.leavingTime,
        this.arrivalTime,
        this.busId,
        this.journeyId,
        this.numberOfAvailableTickets,
        this.destinationName,
        this.startBusStopName,
        this.seats});

  StartDestinationJourney.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketPrice = json['ticketPrice'];
    destinationId = json['destinationId'];
    startBusStopId = json['startBusStopId'];
    leavingTime = json['leavingTime'];
    arrivalTime = json['arrivalTime'];
    busId = json['busId'];
    journeyId = json['journeyId'];
    numberOfAvailableTickets = json['numberOfAvailableTickets'];
    destinationName = json['destinationName'];
    startBusStopName = json['startBusStopName'];
    if (json['seats'] != null) {
      seats = <Seats>[];
      json['seats'].forEach((v) {
        seats!.add(new Seats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticketPrice'] = this.ticketPrice;
    data['destinationId'] = this.destinationId;
    data['startBusStopId'] = this.startBusStopId;
    data['leavingTime'] = this.leavingTime;
    data['arrivalTime'] = this.arrivalTime;
    data['busId'] = this.busId;
    data['journeyId'] = this.journeyId;
    data['numberOfAvailableTickets'] = this.numberOfAvailableTickets;
    data['destinationName'] = this.destinationName;
    data['startBusStopName'] = this.startBusStopName;
    if (this.seats != null) {
      data['seats'] = this.seats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seats {
  String? seatId;
  int? seatNum;
  bool? isAvailable;
  String? busId;
  Bus? bus;

  Seats({this.seatId, this.seatNum, this.isAvailable, this.busId, this.bus});

  Seats.fromJson(Map<String, dynamic> json) {
    seatId = json['seatId'];
    seatNum = json['seatNum'];
    isAvailable = json['isAvailable'];
    busId = json['busId'];
    bus = json['bus'] != null ? new Bus.fromJson(json['bus']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seatId'] = this.seatId;
    data['seatNum'] = this.seatNum;
    data['isAvailable'] = this.isAvailable;
    data['busId'] = this.busId;
    if (this.bus != null) {
      data['bus'] = this.bus!.toJson();
    }
    return data;
  }
}

class Bus {
  String? id;
  int? numberOfSeats;
  List<String>? seats;
  bool? isAvailable;

  Bus({this.id, this.numberOfSeats, this.seats, this.isAvailable});

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numberOfSeats = json['numberOfSeats'];
    seats = json['seats'].cast<String>();
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['numberOfSeats'] = this.numberOfSeats;
    data['seats'] = this.seats;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}
