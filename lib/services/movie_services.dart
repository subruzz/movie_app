import 'package:dio/dio.dart';
import 'package:movie_app/utils/errors/main_exception.dart'; 
import 'package:movie_app/utils/secrets/api_related.dart';
import '../model/movie_model.dart'; 
import '../utils/errors/exception_handler.dart';

/// The ApiServices class is responsible for making API calls related to movies.
class ApiServices {
  /// A singleton instance of Dio for making network requests.
  static final Dio _dio = Dio();

  /// Fetches a list of popular movies from the remote API.
  ///
  /// Returns a [Future] containing a list of [Movies] objects.
  /// Throws a [MainException] if an unexpected error occurs while processing.
  /// Throws a [DioException] if a network error occurs.
  /// Throws [ExceptionHandlers] if the server responds with an error.
  Future<List<Movies>> getPopularMovies() async {
    try {
      // Making a GET request to the API endpoint
      final response = await _dio.get('$baseUrl$popularEndPoint$key');

      // Checking if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parsing the response data
        final Map<String, dynamic> responseData = response.data;
        List<dynamic> movieListData = responseData['results'];

        // Mapping the movie data to a list of Movies objects
        List<Movies> movies = movieListData.map((movieData) {
          return Movies.fromJson(movieData); // Creating Movies instance from JSON
        }).toList();
        return movies; // Returning the list of movies
      } else {
        // Handling bad response with a custom error handler
        throw ExceptionHandlers.handleBadResponse(response);
      }
    } on DioException catch (e) {
      // Handling Dio-specific exceptions
      throw ExceptionHandlers.handleDioExceptions(e);
    } catch (e) {
      // Catching any unexpected exceptions
      throw MainException('An unexpected error occurred: ${e.toString()}');
    }
  }
}
