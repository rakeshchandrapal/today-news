import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/bloc/auth/auth_bloc.dart';
import 'package:today_news/bloc/news/news_bloc.dart';
import 'package:today_news/repository/user_repository.dart';
import 'package:today_news/router.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            userRepository: userRepository,
          ),
        ),
        BlocProvider(
          create: (context) => NewsBloc()..add(LoadNews()),
        ),


      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Today News',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
