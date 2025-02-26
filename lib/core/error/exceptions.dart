import 'package:movie_app/core/network/error_message_mode.dart';

class ServiceException implements Exception {
  final ErrorMessageMode errorMessageMode;
  const ServiceException({required this.errorMessageMode});
}
class LocalDataSourseException implements Exception {
  final String message;
  const LocalDataSourseException({required this.message});
}
