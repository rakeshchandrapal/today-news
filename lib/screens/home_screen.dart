import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news/news_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoaded) {
            return Center(
              child: ListView.builder(
                itemCount: state.newsList.length,
                itemBuilder: (context, index) {
                  final news = state.newsList[index];
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 150,
                        width: width - 20,
                        child: Image.network(
                          news.urlToImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          } else if (state is NewsInitial || state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return  Center(child: ElevatedButton( onPressed: () {
              context.read<NewsBloc>().add(LoadNews());
            },
            child: const Text("Try Again Bad  State"),),);
          }
        },
      ),
    );
  }
}
