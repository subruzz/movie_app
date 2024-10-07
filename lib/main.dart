import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/cubit/auh_cubit/auth_cubit.dart';
import 'package:movie_app/cubit/movie_cubit/movie_cubit.dart';
import 'package:movie_app/model/user.dart';
import 'package:movie_app/services/hive_services.dart';
import 'package:movie_app/services/movie_services.dart';
import 'package:movie_app/view/common_widgets/messenger.dart';
import 'package:movie_app/view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              UserService(Hive.box<User>('users')),
            ),
          ),
          BlocProvider(
              create: (context) => MoviesCubit(
                    ApiServices(),
                  )..fetchPopularMovies())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'New Project',
          scaffoldMessengerKey: Messenger.scaffoldKey,
          theme: ThemeData(primaryColor: Colors.black),
          home: const SplashScreen(),
        ));
  }
}
