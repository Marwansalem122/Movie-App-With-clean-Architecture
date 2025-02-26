import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstant {
  static final String NOWPLAYINGPATH =
      '${dotenv.env['BASE_URL']}/movie/now_playing?api_key=${dotenv.env['API_KEY']}';
  static final String POPULARPATH =
      '${dotenv.env['BASE_URL']}/movie/popular?api_key=${dotenv.env['API_KEY']}';
  static final String TOPRATEDPATH =
      '${dotenv.env['BASE_URL']}/movie/top_rated?api_key=${dotenv.env['API_KEY']}';
        static String movieDetailsPath(int movieId) =>
      "${dotenv.env['BASE_URL']}/movie/$movieId?api_key=${dotenv.env['API_KEY']}";

  static String recommendationPath(int movieId) =>
      "${dotenv.env['BASE_URL']}/movie/$movieId/recommendations?api_key=${dotenv.env['API_KEY']}";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
