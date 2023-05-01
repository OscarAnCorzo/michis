
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:michis/src/core/failures.dart';
import 'package:michis/src/core/http/api_cats.dart';
import 'package:michis/src/features/data/models/breed_model.dart';

abstract class RemoteDataSource {
  Future<List<BreedModel>> getCats();
}


class RemoteDataSourceImpl extends ApiCatsProvider implements RemoteDataSource {

  @override
  Future<List<BreedModel>> getCats() async {
    try {
      log('/breeds', name: 'GET');

      final resp = await dio!.get('/breeds');

      if(resp.data is! List) throw Exception('Respuesta remota inmanejable');

      return List<BreedModel>.from(resp.data.map((x) => BreedModel.fromJson(x)));
    } catch (e) {
      if(e is DioError) throw ServerFailure(error: e);
      else throw DataLayerFailure.fromError(e);
    }
  }

  // @override
  // Future<PaginatedResponseModel<CharacterEntity>> getCharacters(Map<String, dynamic> params) async {
  //   try {
  //     log('/character', name: 'GET');
  //     log(params.toString(), name:'GET-data');

  //     final resp = await dio!.get('/character', queryParameters: params);

  //     // log(resp.data);

  //     // Map<String,dynamic> body = resp.data['data'];
  //     List<CharacterEntity> list = List<CharacterEntity>.from(resp.data['results'].map((x) => CharacterModel.fromJson(x)));
      
  //     return PaginatedResponseModel.fromJson(resp.data['info'], list, params['page']);
  //   } on DioError catch (e) {
  //     if(e.response?.statusCode == 404) return PaginatedResponseModel.fromJson({}, [], params['page']);
  //     else throw ServerFailure(error: e);
  //   }
  // }

  // @override
  // Future<List<CharacterEntity>> getInteresting(Map<String, dynamic> params) async {
  //   try {
  //     log('/character', name: 'GET');
  //     log(params.toString(), name:'GET-data');

  //     final resp = await dio!.get('/character${params['ids'] == null ?'' :'/'+params['ids'].join(',')}');

  //     // log(resp.data);

  //     // Map<String,dynamic> body = resp.data['data'];
  //     List<CharacterEntity> list = List<CharacterEntity>.from(resp.data.map((x) => CharacterModel.fromJson(x)));
      
  //     return list;
  //   } on DioError catch (e) {
  //     if(e.response?.statusCode == 404) return [];
  //     else throw ServerFailure(error: e);
  //   }
  // }

  // @override
  // Future<List<EpisodeEntity>> getEpisodes(Map<String, dynamic> params) async {
  //   try {
  //     log('/episode', name: 'GET');
  //     log(params.toString(), name:'GET-data');

  //     final resp = await dio!.get('/episode${params['ids'] == null ?'' :'/'+params['ids'].join(',')}');

  //     List<EpisodeEntity> list = List<EpisodeEntity>.from(resp.data.map((x) => EpisodeModel.fromJson(x)));
      
  //     return list;
  //   } on DioError catch (e) {
  //     if(e.response?.statusCode == 404) return [];
  //     else throw ServerFailure(error: e);
  //   }
  // }

  
}