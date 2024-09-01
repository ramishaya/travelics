import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tourism/bussines_logic/cubits/cubit/cubit/city_guide_cubit.dart';
import 'package:tourism/const/const.dart';
import 'package:tourism/presentation/widgets/home_page_widgets/header.dart';
import '../../../data/models/city_guide.dart';
import '../../../data/models/main_categories.dart';
import '../../../data/models/city.dart';
import '../../widgets/home_page_widgets/category_card_builder.dart';
import '../../widgets/home_page_widgets/city_card_builder.dart';
import '../../widgets/home_page_widgets/home_text.dart';
import '../../widgets/home_page_widgets/ideas_card.dart';


