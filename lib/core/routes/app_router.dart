import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/routes/base_routes.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/movie/presentation/bloc/movie_details_bloc.dart';
import 'package:movie_app/movie/presentation/bloc/movies_event.dart';
import 'package:movie_app/movie/presentation/componnents/components.dart';
import 'package:movie_app/movie/presentation/pages/movie_detail_screen.dart';

import 'package:movie_app/movie/presentation/pages/movies_page.dart';

class AppRouter {
  // ignore: strict_raw_type
  Route generateRoute(RouteSettings settings) {
    //  this arguments to be passed in any screen  like this (arguments & className)
    // final argument = settings.arguments;
    switch (settings.name) {
      case Routes.moviePage:
        return BaseRoute(
          page: BlocProvider(
            create:
                (context) =>
                    sl<MoviesBloc>()
                      ..add(GetNowPlayingMoviesEvent())
                      ..add(GetPopularMoviesEvent())
                      ..add(GetTopRatedMoviesEvent()),
            child: const MoviesPage(),
          ),
        );
      case Routes.movieDetailPage:
        final args = settings.arguments as Map<String, dynamic>;
        return BaseRoute(
          page: BlocProvider(
            create:
                (context) =>
                    sl<MovieDetailsBloc>()
                      ..add(GetMovieDetailsEvent(movieId: args['id'] as int))
                      ..add(
                        GetMovieRecommendationEvent(movieId: args['id'] as int),
                      ),

            child: MovieDetailScreen(id: args['id'] as int),
          ),
        );
      // case Routes.signupScreen:
      //   return BaseRoute(page: MultiBlocProvider(
      //     providers: [
      //        BlocProvider(create: (context) => sl<AuthBloc>()),
      //       BlocProvider(create: (context) => sl<UploadImageCubit>()),
      //     ],
      //     child: const SignUpScreen(),
      //   ),);
      // case Routes.homeAdminScreen:
      //   return BaseRoute(page: const HomeAdminScreen());
      //    case Routes.productDetailsScreen:
      //   return BaseRoute(
      //     page: ProductDetailsScreen(
      //       productId: settings.arguments! as int,
      //     ),
      //   );
      // case Routes.homeCustomerScreen:
      //   return BaseRoute(page: const HomeCustomerScreen());
      default:
        return BaseRoute(page: const ErrorPage());
    }
  }
}

MaterialPageRoute<dynamic> materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: const Center(child: Text("Error")),
    );
  }
}
