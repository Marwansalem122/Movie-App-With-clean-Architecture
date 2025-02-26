import 'package:flutter/material.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/movie_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String envFile = String.fromEnvironment(
    'ENV',
    defaultValue: '.env.dev',
  );
  await dotenv.load(fileName: envFile);
  ServiceLocator().init();


  runApp(const MovieApp());
}
