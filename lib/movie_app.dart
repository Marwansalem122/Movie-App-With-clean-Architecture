import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/app_router.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/utils/app_string.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      initialRoute: Routes.moviePage,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
