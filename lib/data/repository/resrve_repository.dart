// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:tourism/data/web_services/reserve_web_services.dart';

// class ReserveRepository {
//   final ReserveWebServices reserveWebServices;
//   ReserveRepository({required this.reserveWebServices});

//   Future<dynamic> makeReserve(
//       String email, int password, int roomId, int duration) async {
//         try{
//           final response =
//         await reserveWebServices.makeResreve(email, password, roomId, duration);
//     List<String> reserveResponse =
//         (jsonDecode(response) as List<dynamic>).cast<String>();
//     print(reserveResponse);
//     return reserveResponse;
//         }
//         catch(e){
//       print(e.toString());
//       print("error in  reserve repository");
//       return [];
//         }

//   }
// }

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tourism/data/models/reserve_model.dart';
import 'package:tourism/data/web_services/reserve_web_services.dart';

class ReserveRepository {
  final ReserveWebServices reserveWebServices;
  ReserveRepository({required this.reserveWebServices});

  Future<dynamic> makeReserve(
      String email, int password, int roomId, int duration) async {
    try {
      final response = await reserveWebServices.makeResreve(
          email, password, roomId, duration);

      print(response['message']);
      return Reserve(message: response['message']);
    } catch (e) {
      print(e.toString());
      print("error in reserve repository");
      return "errorrrr"; // or appropriate error handling
    }
  }
}
