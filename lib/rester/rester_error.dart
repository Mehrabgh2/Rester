import 'package:equatable/equatable.dart';

abstract class ResterError extends Equatable {
  const ResterError([List properties = const <dynamic>[]]);
}

class TimeoutError extends ResterError {
  @override
  List<Object?> get props => [];
}

class ServerError extends ResterError {
  @override
  List<Object?> get props => [];
}
