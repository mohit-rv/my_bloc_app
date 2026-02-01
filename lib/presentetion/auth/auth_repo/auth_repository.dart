
import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoint.dart';

// class AuthRepository {
//   final ApiClient apiClient;
//
//   AuthRepository({required this.apiClient});
//
//   Future<String> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await apiClient.dio.post(
//         ApiEndpoints.login,
//         data: {
//           "email": email,
//           "password": password,
//         },
//       );
//
//       return response.data["token"];
//     } catch (e) {
//       if (e is DioError) {
//         throw Exception(e.response?.data["error"] ?? "Login failed");
//       }
//       throw Exception("Login failed");
//     }
//   }
// }


class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      print('login api:  ${ApiEndpoints.login}');
      final response = await apiClient.dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      // ReqRes returns: { "token": "QpwL5tke4Pnpja7X4" }
      return response.data["access_token"];
    } on DioException catch (e) {
      final msg = e.response?.data["error"] ?? "Login failed";
      throw Exception(msg);
    } catch (e) {
      throw Exception("Login failed");
    }
  }
}