import 'package:dio/dio.dart';

// class ApiClient {
//   final Dio dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://jsonplaceholder.typicode.com',
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//     ),
//   );
// }




// class ApiClient {
//   final Dio _dio;
//   Dio get dio => _dio; // <-- ADD THIS GETTER
//
//   ApiClient()
//       : _dio = Dio(
//     BaseOptions(
//      // baseUrl: 'https://jsonplaceholder.typicode.com',
//      // baseUrl: 'https://reqres.in/api',
//       baseUrl: 'https://fakestoreapi.com',
//
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//     ),
//   );
//
//   Future<Response> get(
//       String path, {
//         Map<String, dynamic>? query,
//       }) async {
//     return await _dio.get(
//       path,
//       queryParameters: query,
//     );
//   }
// }


// for multiple base url


import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  Dio get dio => _dio;

  ApiClient()
      : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.escuelajs.co/api/v1/auth/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // ---------------- GET ----------------
  Future<Response> get(
      String path, {
        Map<String, dynamic>? query,
      }) async {
    return await _dio.get(
      path,
      queryParameters: query,
    );
  }

  // ---------------- POST (JSON) ----------------
  Future<Response> post(
      String path, {
        Map<String, dynamic>? data,
      }) async {
    return await _dio.post(path, data: data);
  }

  // ---------------- POST (FORM DATA) 🔥 ----------------
  Future<Response> postFormData(
      String path, {
        required Map<String, dynamic> data,
      }) async {
    final formData = FormData.fromMap(data);

    return await _dio.post(
      path,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );
  }

  // ---------------- PUT ----------------
  Future<Response> put(
      String path, {
        Map<String, dynamic>? data,
      }) async {
    return await _dio.put(path, data: data);
  }

  // ---------------- DELETE ----------------
  Future<Response> delete(String path) async {
    return await _dio.delete(path);
  }
}

