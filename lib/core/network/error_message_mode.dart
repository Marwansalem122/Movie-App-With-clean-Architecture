import 'package:equatable/equatable.dart';

class ErrorMessageMode extends Equatable {
  final int statusCode;
  final String message;
  final bool success;
  const ErrorMessageMode({
    required this.statusCode,
    required this.message,
    required this.success,
  });

  factory ErrorMessageMode.fromJson(Map<String, dynamic> json) =>
      ErrorMessageMode(
        statusCode: json['status_code'],
        message: json['status_message'],
        success: json['success'],
      );
  @override
  List<Object?> get props => [statusCode, message, success];
}
