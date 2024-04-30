import 'dart:async';
import 'dart:developer' as dev;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/repository/news_repository.dart';

import '../../models/news_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<LoadNews>(_onLoadNews);
  }

  FutureOr<void> _onLoadNews(LoadNews event, Emitter<NewsState> emit) async {
    try {
      emit(NewsLoading());
      final List<NewsModel> list = await NewsRepository().getList();
     dev.log(list.toString());
      emit(NewsLoaded(list));
    }
    catch(e){
      emit(NewsError(e.toString()));
    }
  }
}
