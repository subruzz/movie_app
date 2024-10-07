part of 'movie_cubit.dart';

sealed class MoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movies> movies;

  MoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MoviesError extends MoviesState {
  final String error;

  MoviesError(this.error);

  @override
  List<Object> get props => [error];
}
