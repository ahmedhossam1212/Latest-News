import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/models/news_model.dart';
import 'package:latest_news/presntation/manager/states/trending_states.dart';

class TrendingCubit extends Cubit<TrendingStates> {
  TrendingCubit() : super(TrendingInitState());

  static TrendingCubit get(context) => BlocProvider.of(context);

  List trends = [];

  void getTrends({bool fromPagination = false}) async {
    if (fromPagination) {
      emit(TrendingPaginationState());
    } else {
      emit(TrendingLoadingState());
    }

    try {
      final response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?apiKey=9366f1f9c66749b78e18d5aa73b29511&language=$lang",
      );
      var model = NewsModel.fromJson(response.data);
      trends = model.articles;

      emit(TrendingSuccessState());
    } catch (e) {
      emit(TrendingErrState());
    }
  }
}
