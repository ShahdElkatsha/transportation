

import '../../../Data/Models/get_all_bus_stop.dart';

abstract class BusStopState {}
class BusStopInitial  extends BusStopState {}
class BusStopSuccess  extends BusStopState {
  List<String> items;
  BusStopSuccess(this.items);
}
class BusStopLoading  extends BusStopState {}
class BusStopFailure  extends BusStopState {}
