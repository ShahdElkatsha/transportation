
import 'package:dartz/dartz.dart';
import 'package:transportation/core/services/api/api_errors.dart';

import '../Models/destination_journeys.dart';
import '../Models/get_all_bus_stop.dart';

abstract class HomeRepo {
   Future<Either<Failure,List<DestinationPoint>>> GetBussesByStartPointAndDestination(String start_point,String destination);

   Future<Either<Failure,List<DestinationPoint>>> GetPreviousTickets();

   Future<Either<Failure,List<Item>>> GetAllBusStops();

}



