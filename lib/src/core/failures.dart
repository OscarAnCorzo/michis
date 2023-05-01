import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [this.message];
}

class ServerFailure extends Failure {
  final DioError error;
  final int? statusCode;
  final Map<String, dynamic>? data;

  ServerFailure({required this.error, this.data, this.statusCode}): super(error.message) {
    log(error.requestOptions.uri.toString(), name: 'HTTPFailure: Url', level: 2);
    log(error.requestOptions.method, name: 'HTTPFailure: Method', level: 2);
    if(this.data != null) log(data.toString(), name: 'HTTPFailure: Data enviada', level: 2);
    log((error.response?.data ?? 'no data response').toString(), name: 'HTTPFailure: Data recibida', level: 2);
    log(error.toString(), name: 'HTTPFailure: Error', level: 2);
  }

  factory ServerFailure.fromError(DioError error, String method){
    Map<String, dynamic> data = {};

    if(error.requestOptions.data != null) {
      if(error.requestOptions.data is String){
        try { data = jsonDecode(error.requestOptions.data); }
        catch (e) { data['noJSON'] = error.requestOptions.data; }
      }else if(error.requestOptions.data is FormData) {
        if((error.requestOptions.data as FormData).fields.isNotEmpty) data['fields'] = (error.requestOptions.data as FormData).fields;
        if((error.requestOptions.data as FormData).files.isNotEmpty) data['files'] = (error.requestOptions.data as FormData).files;
      }else if(error.requestOptions.data is Map) data = error.requestOptions.data;
    }

    if(error.requestOptions.queryParameters.isNotEmpty) data['queryParameters'] = error.requestOptions.queryParameters;

    return ServerFailure(
      error: error,
      statusCode: error.response?.statusCode,
      data: data,
    );
  }
}

class DataLayerFailure extends Failure {
  final Object error;

  DataLayerFailure({required this.error}): super(error.toString()) {
    log(error.toString(), name: 'DataLayerFailure');
  }

  factory DataLayerFailure.fromError(Object error) {
    return DataLayerFailure(
      error: error,
    );
  }
}


class DomainLayerFailure extends Failure {
  final Object error;

  DomainLayerFailure({required this.error}): super(error.toString()) {
    log(error.toString(),name: 'DomainLayerFailure');
  }

  factory DomainLayerFailure.fromError(Object error) {
    return DomainLayerFailure(
      error: error
    );
  }
}