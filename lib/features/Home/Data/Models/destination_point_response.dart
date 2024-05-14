import 'destination_journeys.dart';

class DestinationPointResponse {
  final List<DestinationPoint> body;

  DestinationPointResponse({required this.body});

  factory DestinationPointResponse.fromJson(Map<String, dynamic> json) {
    var destinationPointList = json['body'] as List;
    List<DestinationPoint> destinationPoints = destinationPointList
        .map((point) => DestinationPoint.fromJson(point))
        .toList();
    return DestinationPointResponse(body: destinationPoints);
  }
}