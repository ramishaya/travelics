
import '../models/sign_up.dart';

import '../web_services/sign_up_web_services.dart';


class SignupRepository {
  final SignupWebServices signupWebServices;

  //late SignUpModel signupModel;

  SignupRepository({required this.signupWebServices});

  // Future<SignupModel> signup_r(
  //   String First_name,
  //   String Last_name,
  //   String nationality,
  //   String email,
  //   String password,
  // ) async {
  //   try {
  //     final response = await signupWebServices.postSignup(
  //       url: '/api/register',
  //       data: {
  //         'First_name': First_name,
  //         'Last_name': Last_name,
  //         'nationality': nationality,
  //         'email': email,
  //         'password': password,
  //       },
  //     );
  //
  //     print('Hello3');
  //     print("result= ${response.data}");
  //
  //     final signupModel = SignupModel.fromJson(response.data);
  //
  //     print('Hello4');
  //     print('$signupModel');
  //     print('Token: ${signupModel.token}');
  //     print('Hello4');
  //     print('Token: ${signupModel.state}');
  //     print('Hello4');
  //     print('Token: ${signupModel}');
  //     print('Hello77');
  //     print('Token: ${signupModel.user?.email}');
  //     print('Token: ${signupModel.user}');
  //     //   print('State: ${signupModel?.state}');
  Future<SignupModel> signup_r(String First_name,
      String Last_name,
      String nationality,
      String email,
      String password,) async {
    try {
      final response = await signupWebServices.postSignup(
        url: '/api/register',
        data: {
          'First_name': First_name,
          'Last_name': Last_name,
          'nationality': nationality,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        // Validate if the response data contains required fields
        if (responseData.containsKey('token') &&
            responseData.containsKey('state')) {
          final signupModel = SignupModel.fromJson(responseData);
          print('Hello4');
          print('Token: ${signupModel.token}');
              print('Hello5');
              print('Token: ${signupModel.state}');
              print('Hello6');

              print('Hello77');

          return signupModel;
        } else {
          throw Exception('Invalid API response: Missing required fields.');
        }
      } else {
        throw Exception(
            'API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to signup: $e');
    }
  }
}

//       return signupModel;
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to signup: $e');
//     }
//   }
// }
