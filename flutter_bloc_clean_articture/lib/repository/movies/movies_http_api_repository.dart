

import 'package:flutter_bloc_clean_articture/Data/network/network_services_api.dart';
import 'package:flutter_bloc_clean_articture/config/app_url.dart';
import 'package:flutter_bloc_clean_articture/models/movies/movies.dart';
import 'package:flutter_bloc_clean_articture/repository/movies/movies_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository{

  final _apiServices = NetworkApiService();

  @override
  Future<MoviesModel> fetchMoviesList() async{
    final response = await _apiServices.getApi(AppUrl.popularMoviesListEndPoint);
    return MoviesModel.fromJson(response);
  }

}