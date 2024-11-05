
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clean_articture/Data/response/api_response.dart';
import 'package:flutter_bloc_clean_articture/models/movies/movies.dart';

class MoviesState extends Equatable {

  final ApiResponse<MoviesModel> moviesList;

  const MoviesState({
    required this.moviesList,
  });

  MoviesState copyWith({ApiResponse<MoviesModel>? moviesList,}) {
    return MoviesState(moviesList: moviesList ?? this.moviesList);
    }

  @override
  List<Object?> get props => [moviesList];
}