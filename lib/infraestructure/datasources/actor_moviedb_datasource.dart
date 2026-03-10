import 'package:cinemapedia_flutter/config/enviroment/enviroment.dart';
import 'package:cinemapedia_flutter/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia_flutter/domain/entities/actor.dart';
import 'package:cinemapedia_flutter/infraestructure/mappers/actor_mapper.dart';
import 'package:cinemapedia_flutter/infraestructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'en-US',
      },
    ),
  );

  List<Actor> _jsonToActorMovie(Map<String, dynamic> json) {
    final CreditsResponse creditsResponse = CreditsResponse.fromJson(json);
    final List<Actor> actors = creditsResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    return _jsonToActorMovie(response.data);
  }
}
