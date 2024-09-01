// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/cubits/trip_type/trip_type_cubit.dart';
import 'package:tourism/const/const.dart';

import '../../../data/models/trip_type_model.dart';

class TripTypeWidget extends StatelessWidget {
  const TripTypeWidget({super.key, required this.tripTypeModel});
  final TripTypeModel tripTypeModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripTypeCubit, TripTypeState>(
      builder: (context, state) {
        final tripTypeState = BlocProvider.of<TripTypeCubit>(context);

        // isSelected = tripTypeState.tripTypeID == tripTypeModel.id;
        return GestureDetector(
          onTap: () {
            tripTypeState.selectTripType(tripTypeModel.id, tripTypeModel.name);
            
            print(tripTypeState.name);
            print(tripTypeState.tripTypeID);
          },
          child: Container(
            width: 110,
            height: 40,
            margin: const EdgeInsets.only(top: 20  ),
            decoration: BoxDecoration(
              color: ((tripTypeModel.id == tripTypeState.tripTypeID))
                  ? const Color(kPrimaryColor)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: const Color(0XFFE0E0E0)),
            ),
            child: Center(
              child: Text(
                tripTypeModel.name,
                style: (tripTypeModel.id == tripTypeState.tripTypeID)
                    ? const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold , fontSize: 15)
                    : const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold , fontSize: 15),
              ),
            ),
          ),
        );
      },
    );
  }
}
