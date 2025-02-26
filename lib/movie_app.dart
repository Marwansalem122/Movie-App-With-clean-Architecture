import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/app_router.dart';
import 'package:movie_app/core/routes/routes.dart';


class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: Routes.moviePage,
      onGenerateRoute: AppRouter().generateRoute,
      // home:MoviesPage()
    );
  }
}
