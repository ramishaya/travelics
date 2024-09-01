import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/bussines_logic/cubits/trip_type/trip_type_cubit.dart';

import 'package:tourism/presentation/widgets/flights_search_widgets.dart/trip_type_widget.dart';

import '../../../data/models/trip_type_model.dart';

class MyTaps extends StatelessWidget {
  const MyTaps({required this.size, super.key});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripTypeCubit(),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final type in tripType) TripTypeWidget(tripTypeModel: type)
        ],
      ),
    );
  }
}
