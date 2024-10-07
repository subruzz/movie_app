import 'package:dio/dio.dart';
import 'package:movie_app/utils/errors/main_exception.dart';
import 'package:movie_app/utils/secrets/api_related.dart';
import '../model/movie_model.dart';
import '../utils/errors/exception_handler.dart';

class ApiServices {
  static final Dio _dio = Dio();

  Future<List<Movies>> getPopularMovies() async {
    try {
      final response = await _dio.get('$baseUrl$popularEndPoint$key');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        List<dynamic> movieListData = responseData['results'];

        List<Movies> movies = movieListData.map((movieData) {
          return Movies.fromJson(movieData);
        }).toList();
        return movies;
      } else {
        throw ExceptionHandlers.handleBadResponse(response);
      }
    } on DioException catch (e) {
      throw ExceptionHandlers.handleDioExceptions(e);
    } catch (e) {
      throw MainException('An unexpected error occurred: ${e.toString()}');
    }
  }
}
