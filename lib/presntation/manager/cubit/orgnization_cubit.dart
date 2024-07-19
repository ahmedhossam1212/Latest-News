import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/presntation/manager/states/orgnizations_states.dart';

import '../../../models/news_model.dart';

class OrgnizationCubit extends Cubit <OrgnizationsStates>{
  OrgnizationCubit():super(OrgInitState());
  static OrgnizationCubit get(context)=> BlocProvider.of(context);

  List orgs = [];

  void fetchXNews({bool fromPagination = false})async{
    if (fromPagination) {
      emit(OrgPaginationState());
    } else {
      emit(OrgLoadingState());
    }

    try {
      final response = await Dio().get(
        "https://newsapi.org/v2/everything?q=X&apiKey=9366f1f9c66749b78e18d5aa73b29511",
      );
      var model = NewsModel.fromJson(response.data);
      orgs = model.articles;
      log("${orgs.length}");
      emit(OrgSuccessState());
    } catch (e) {
      emit(OrgErrState());
    }
  }

}