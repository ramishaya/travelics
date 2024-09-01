import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trip_type_state.dart';

class TripTypeCubit extends Cubit<TripTypeState> {
  TripTypeCubit() : super(TripTypeInitial());

  int tripTypeID = 1;
  String name = "One Way";

  void selectTripType(int tripTypeID, String name) {
    this.tripTypeID = tripTypeID;
    this.name = name;
    if (tripTypeID == 1) {
      emit(TripTypeOneWay());
    } else {
      emit(TripTypeRoundTrip());
    }
    
  }

  void reset() {
    tripTypeID = 1; // Set the default trip type
    emit(TripTypeInitial());
  }
}
