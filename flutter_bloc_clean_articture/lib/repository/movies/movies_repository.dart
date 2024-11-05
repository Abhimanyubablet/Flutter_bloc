
import 'package:flutter_bloc_clean_articture/models/movies/movies.dart';

abstract class MoviesRepository {
   Future<MoviesModel> fetchMoviesList();
}