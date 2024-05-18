import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportation/features/Home/Data/Models/get_all_bus_stop.dart';
import '../../../../../core/services/api/api_errors.dart';
import '../../../Data/Repos/home_repo.dart';
import 'bus_stop_states.dart';

class BusStopsCubit extends Cubit<BusStopState> {
  final HomeRepo homeRepo;

  BusStopsCubit(this.homeRepo) : super(BusStopInitial());

  void getBusStops() async {
    emit(BusStopLoading());

    final response = await homeRepo.GetAllBusStops();

    response.fold((failure) {
      emit(BusStopFailure());
    }, (busStops) {
      List<String> items = busStops.map((item) => item.name ?? "EmptyName").toList();
      // emit(BusStopSuccess(items: items));
      emit(BusStopSuccess(items));
    });
  }
}










//last code

// import 'package:dartz/dartz.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:transportation/features/Home/Data/Models/get_all_bus_stop.dart';
//
// import '../../../../../core/services/api/api_errors.dart';
// import '../../../Data/Repos/home_repo.dart';
// import 'bus_stop_states.dart';
//
// class BusStopsCubit extends Cubit<BusStopState> {
//   BusStopsCubit(this.homeRepo) : super(BusStopInitial());
//   HomeRepo homeRepo;
//   Future<Either<Failure, List<Item>>> getBusStops()async
//   {
//     final response = await homeRepo.GetAllBusStops();
//     emit(BusStopLoading());
//
//     return response.fold((failure) {
//       emit(BusStopFailure());
//
//       return Left(failure);
//     }, (response) {
//       List<String>?items;
//       for(int i=0;i<response.length;i++)
//         {
//           items?[i]=response[i].name??"EmptyName";
//           print(response[i].name??"EmptyName");
//
//         }
//       print('list????????????????????????????????????????');
//       emit(BusStopSuccess(items??[]));
//
//       return Right(response);
//     });
//   }
// }