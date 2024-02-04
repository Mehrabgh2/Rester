import 'dart:convert';

import 'package:rester/rester/rester_type.dart';
import 'package:equatable/equatable.dart';

class ResterRequest extends Equatable {
  final String endpoint;
  final ResterType type;
  final Object? body;
  final Map<String, String>? headers;
  final Encoding? encoding;
  final int? timeout;
  final String? uuid;
  final bool inIsolate;
  final bool formData;

  const ResterRequest({
    required this.endpoint,
    required this.type,
    this.body,
    this.headers,
    this.encoding,
    this.timeout,
    this.uuid,
    this.inIsolate = false,
    this.formData = false,
  });

  ResterRequest copyWith({
    String? endpoint,
    ResterType? type,
    Object? body,
    Map<String, String>? headers,
    Encoding? encoding,
    int? timeout,
    String? uuid,
    bool? inIsolate,
    bool? formData,
  }) {
    return ResterRequest(
      endpoint: endpoint ?? this.endpoint,
      type: type ?? this.type,
      body: body ?? this.body,
      headers: headers ?? this.headers,
      encoding: encoding ?? this.encoding,
      timeout: timeout ?? this.timeout,
      uuid: uuid ?? this.uuid,
      inIsolate: inIsolate ?? this.inIsolate,
      formData: formData ?? this.formData,
    );
  }

  @override
  List<Object?> get props => [
        endpoint,
        type,
        body,
        headers,
        encoding,
        timeout,
        uuid,
        inIsolate,
        formData,
      ];
}
