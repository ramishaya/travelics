
import '../models/update_profile.dart';
import '../web_services/update_profile_web_services.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class UpdateProfileRepository {
  final UpdateProfileWebServices updateProfileWebServices;

  UpdateProfileRepository({required this.updateProfileWebServices});

  Future<UpdateProfileModel> postUpdateProfile(
      String First_name,
      String Last_name,
      String nationality,
      String gender,
      File image
      ) async {
    try {
     String imageName = image.path.split('/').last;

      FormData formData = FormData.fromMap({
        'First_name': First_name,
        'Last_name': Last_name,
        'nationality': nationality,
        'gender': gender,
       'image': await MultipartFile.fromFile(image.path, filename: imageName),
      });

      final response = await updateProfileWebServices.postUpdateProfile(
        url: '/api/update_profile',
        data: formData,
      );

      print('Hello3');
      print('$response.data');
      final updateProfileModel = UpdateProfileModel.fromJson(response.data);
      print('Hello4');
      print('$updateProfileModel');
      print("response=${updateProfileModel}");
      print("response=${updateProfileModel.state}");
      return updateProfileModel;
    } catch (e) {
      throw Exception('Failed $e');
    }
  }
}
/*ddddddddddddddddddd*/





// import '../models/update_profile_model.dart';
// import '../web_services/update_profile_web_services.dart';
//
// class UpdateProfileRepository {
//   final UpdateProfileWebServices updateProfileWebServices;
//
//   UpdateProfileRepository({required this.updateProfileWebServices});
//
//   Future<UpdateProfileModel> postUpdateProfile(String First_name , String Last_name,String nationality,String gender) async {
//     try {
//       final response = await updateProfileWebServices.postUpdateProfile(
//         url: '/api/update_profile',
//         data: {
//           'First_name': First_name,
//           'Last_name': Last_name,
//           'nationality': nationality,
//           'gender': gender,
//
//         },
//       );
//       print('Hello3');
//       print('$response.data');
//       final updateProfileModel = UpdateProfileModel.fromJson(response.data);
//       print('Hello4');
//
//       return updateProfileModel;
//     } catch (e) {
//       throw Exception('Failed to login: $e');
//     }
//   }
// }
