

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_clean_articture/Data/response/api_response.dart';
import 'package:flutter_bloc_clean_articture/bloc/movies/movies_event.dart';
import 'package:flutter_bloc_clean_articture/bloc/movies/movies_state.dart';
import 'package:flutter_bloc_clean_articture/repository/movies/movies_repository.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository}) : super(MoviesState(moviesList: ApiResponse.loading())){
    on<MoviesFetched>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi (MoviesFetched event, Emitter<MoviesState>emit) async{
   await moviesRepository.fetchMoviesList().then((value){
    emit(state.copyWith(moviesList: ApiResponse.completed(value)));
   }).onError((error, stackTrace){
     emit(state.copyWith(moviesList: ApiResponse.error(error.toString())));
   });
  }

}