import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism/data/repository/offers_repository.dart';

import '../../../data/models/offers_model.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersRepository offersRepository;
  OffersCubit({required this.offersRepository}) : super(OffersInitial());
  List<Offers> offers = [];

   void fetchOffers(String hotelName) {
     offersRepository.fetchOffers(hotelName).then((e) {
       emit(OffersLoaded(e));
       //offers = e;
       print("we are in the offers Cubit offers fetched correct ");
       
     }).catchError((error) {
       emit(OffersError("Failed to fetch offers: $error"));
     });
   }
  
   void reset() {
     emit(OffersInitial());
   }
}
