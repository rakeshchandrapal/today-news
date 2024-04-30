import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:today_news/bloc/auth/auth_bloc.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated ) {
            context.go("/home");
          }
        },
        builder: (context, state) {
          if (state is Unauthenticated || state is Uninitialized) {
            return Column(
              children: [
                TextField(
                  controller: emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    final email = emailController.text.toString();
                    final password = passwordController.text.toString();
                    login(email, password,context);
                  },
                )
              ],
            );
          } else {
            context.go('home');
          }

          return Container();
        },
      ),
    );
  }

  void login(String email, String password, BuildContext context) {
    context.read<AuthBloc>().add(LoggedIn(email, password));
  }
}
