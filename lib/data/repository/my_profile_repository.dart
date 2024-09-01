
import '../models/my_profile.dart';
import '../web_services/my_profile_web_sercvices.dart';

class MyProfileRepository {
  final MyProfileWebServices myProfileWebServices;

  MyProfileRepository({required this.myProfileWebServices});

//   Future<MyProfileModel>  myProfile() async {
//     try {
//       final response = await myProfileWebServices.myProfile(
//         url: '/api/profile',
//       );
//       print('Hello33');
//       print('$response.data');
//       final myProfileModel = MyProfileModel.fromJson(response.data);
//       print('Hello44');
//       print('here is the first name: ${myProfileModel.firstName}');
//       print('here is the gender: ${myProfileModel.gender}');
//       return myProfileModel;
//     } catch (e) {
//       throw Exception('Failed: $e');
//     }
//   }
// }
  Future<MyProfileModel> myProfile() async {
    try {
      final response = await myProfileWebServices.myProfile(
        url: '/api/profile',
      );

      final responseData = response.data;

      if (responseData is Map<String, dynamic>) {
        final myProfileModel = MyProfileModel.fromJson(responseData);
        return myProfileModel;
      } else if (responseData is List<dynamic> && responseData.isNotEmpty) {
        final myProfileModel = MyProfileModel.fromJson(responseData[0]);
        print("image=${myProfileModel.image}");
        return myProfileModel;
      } else {
        throw Exception("Invalid response data format");
      }
    } catch (e) {
      throw Exception('Failed: $e');
    }
  }

}