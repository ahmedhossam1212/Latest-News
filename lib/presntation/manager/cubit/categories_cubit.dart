import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/models/news_model.dart';
import 'package:latest_news/presntation/manager/states/categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoryInitState());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  List categories = [];

  void fetchcategories(
      {bool fromPagination = false, String category = ""}) async {
    if (fromPagination) {
      emit(CategoryPaginationState());
    } else {
      emit(CategoryLoadingState());
    }

    try {
      final response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?category=$category&apiKey=9366f1f9c66749b78e18d5aa73b29511&language=$lang",
      );
      var model = NewsModel.fromJson(response.data);
      categories = model.articles;
      emit(CategorySuccessState());
    } catch (e) {
      emit(CategoryErrState());
    }
  }
}
