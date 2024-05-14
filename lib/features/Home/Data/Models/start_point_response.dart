import 'start_point_journeys.dart';

class StartPointResponse {
  final List<StartPoint> body;

  StartPointResponse({required this.body});

  factory StartPointResponse.fromJson(Map<String, dynamic> json) {
    var startPointList = json['body'] as List;
    List<StartPoint> startPoints =
    startPointList.map((point) => StartPoint.fromJson(point)).toList();
    return StartPointResponse(body: startPoints);
  }
}
