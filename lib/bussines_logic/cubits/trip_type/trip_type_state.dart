part of 'trip_type_cubit.dart';

abstract class TripTypeState extends Equatable {
  const TripTypeState();

  @override
  List<Object> get props => [];
}

class TripTypeInitial extends TripTypeState {}

class TripTypeOneWay extends TripTypeState {}

class TripTypeRoundTrip extends TripTypeState {}
