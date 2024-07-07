import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/models/trending_model.dart';
import 'package:latest_news/presntation/manager/states/trending_states.dart';

class TrendingCubit extends Cubit<TrendingStates> {
  TrendingCubit() : super(TrendingInitState());

  static TrendingCubit get(context) => BlocProvider.of(context);

  List trends = [];
  List source = [];

  String country = "us";

  void getTrends() async {
    emit(TrendingLoadingState());
    try {
      final response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=9366f1f9c66749b78e18d5aa73b29511",
      );
      var model = TrendingModel.fromJson(response.data);
      trends = model.articles;

      log("${response.data["articles"]}");
      emit(TrendingSuccessState());
    } catch (e) {
      print(e);
      emit(TrendingErrState());
    }
  }
}
