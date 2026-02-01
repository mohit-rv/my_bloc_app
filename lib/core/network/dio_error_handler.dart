import 'package:dio/dio.dart';

class DioErrorHandler {
  static String getErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Please try again.";

      case DioExceptionType.sendTimeout:
        return "Request timeout. Please try again.";

      case DioExceptionType.receiveTimeout:
        return "Server took too long to respond.";

      case DioExceptionType.badResponse:
        return _handleStatusCode(error.response);

      case DioExceptionType.cancel:
        return "Request was cancelled.";

      case DioExceptionType.connectionError:
        return "No internet connection.";

      case DioExceptionType.unknown:
      default:
        return "Something went wrong. Please try again.";
    }
  }

  static String _handleStatusCode(Response? response) {
    if (response == null) {
      return "Unexpected server error.";
    }

    final statusCode = response.statusCode;

    switch (statusCode) {
      case 400:
        return response.data['message'] ?? "Bad request.";
      case 401:
        return "Unauthorized. Please login again.";
      case 403:
        return "Access denied.";
      case 404:
        return "Resource not found.";
      case 500:
        return "Internal server error.";
      default:
        return "Server error occurred.";
    }
  }
}


// try {
// final response = await dio.get("/users");
// print(response.data);
// } on DioException catch (e) {
// final errorMessage = DioErrorHandler.getErrorMessage(e);
// print(errorMessage);
//
// // UI me show karna ho
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text(errorMessage)),
// );
// }
