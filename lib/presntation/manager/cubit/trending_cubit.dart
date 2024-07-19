import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/presntation/manager/states/trending_states.dart';

import '../../../models/news_model.dart';

class TrendingCubit extends Cubit<TrendingStates> {
  TrendingCubit() : super(TrendingInitState());

  static TrendingCubit get(context) => BlocProvider.of(context);

  List trends = [];
  String country = "us";

  void getTrends({bool fromPagination = false}) async {
    if (fromPagination) {
      emit(TrendingPaginationState());
    } else {
      emit(TrendingLoadingState());
    }

    try {
      final response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=$country&apiKey=9366f1f9c66749b78e18d5aa73b29511",
      );
      var model = NewsModel.fromJson(response.data);
      trends = model.articles;

      emit(TrendingSuccessState());
    } catch (e) {
      emit(TrendingErrState());
    }
  }
}
