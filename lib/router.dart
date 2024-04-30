import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:today_news/bloc/auth/auth_bloc.dart';
import 'package:today_news/repository/user_repository.dart';
import 'package:today_news/screens/home_screen.dart';
import 'package:today_news/screens/login_screen.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),

    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
      // redirect: (context, state)  async {
      //   final userRepo = UserRepository();
      //   final isLogin = await userRepo.getUserId();
      //   if(isLogin == null){
      //     return "/login";
      //   }
      //   else{
      //     return null;
      //   }
      // }
    ),
  ],
);
