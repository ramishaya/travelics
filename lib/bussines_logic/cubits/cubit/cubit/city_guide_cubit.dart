import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/city_guide.dart';
import '../../../../data/repository/city_guide_repository.dart';

part 'city_guide_state.dart';

class CityGuideCubit extends Cubit<CityGuideState> {
  final CityGuideRepository cityGuideRepository;
  CityGuideCubit({required this.cityGuideRepository})
      : super(CityGuideInitial());
  List<CityGuide> cityGuideList = [];

  // List<CityGuide> getAllCity() {
  //   cityGuideRepository.gatAllCity().then((e) {
  //     emit(CityGuideLoaded(e));
  //     cityGuideList = e;
  //   });

  //   print("we are in cubit");
  //   print(cityGuideList[0]);
  //   return cityGuideList;
  // }

  Future<void> getAllCity() async {
    try {
      emit(CityGuideLoading());

      final cityGuide = await cityGuideRepository.gatAllCity();
      emit(CityGuideLoaded(cityGuide));
    } catch (e) { 
      emit(CityGuideError(e.toString()));
    }
  }
}
