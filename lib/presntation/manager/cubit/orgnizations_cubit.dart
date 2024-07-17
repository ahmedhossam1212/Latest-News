import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/models/trending_model.dart';
import 'package:latest_news/presntation/manager/states/orgnizations_states.dart';

class OrgnizationsCubit extends Cubit<OrgnizationsStates> {
  OrgnizationsCubit() : super(OrgInitState());

  OrgnizationsCubit get(context) => BlocProvider.of(context);

  List orgnizations = [];

  void getOrgs(
      {bool fromPagination = false, required String orgnization}) async {
    if (fromPagination) {
      emit(OrgPaginationState());
    } else {
      emit(OrgLoadingState());
    }

    try {
      final response = await Dio().get(
        "https://newsapi.org/v2/everything?q=$orgnization&apiKey=9366f1f9c66749b78e18d5aa73b29511",
      );
      var model = NewsModel.fromJson(response.data);
      orgnizations = model.articles;
      log("${orgnization.length}");
      emit(OrgSuccessState());
    } catch (e) {
      emit(OrgErrState());
    }
  }
}
