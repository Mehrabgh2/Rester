import 'package:rester/rester/rester_error.dart';
import 'package:equatable/equatable.dart';

class ResterResponse extends Equatable {
  final ResterResponseSuccess? success;
  final ResterResponseFailure? failure;

  const ResterResponse({this.success, this.failure});

  @override
  List<Object?> get props => [success, failure];
}

class ResterResponseSuccess extends Equatable {
  final String? message;
  final int? statusCode;

  const ResterResponseSuccess({this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class ResterResponseFailure extends Equatable {
  final ResterError? error;
  const ResterResponseFailure({this.error});

  @override
  List<Object?> get props => [error];
}
