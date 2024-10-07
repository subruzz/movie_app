import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/utils/errors/main_exception.dart';
import '../../services/movie_services.dart';
import 'package:equatable/equatable.dart';

import '../../model/movie_model.dart';

part 'movie_state.dart';
class MoviesCubit extends Cubit<MoviesState> {
  final ApiServices apiServices;

  MoviesCubit(this.apiServices) : super(MoviesInitial());

  Future<void> fetchPopularMovies() async {
    emit(MoviesLoading());

    try {
      final movies = await apiServices.getPopularMovies();
      emit(MoviesLoaded(movies));
    } on MainException catch (e) {
      emit(MoviesError(e.message));
    } catch (e) {
      emit(MoviesError('An unexpected error occurred: $e'));
    }
  }
}
