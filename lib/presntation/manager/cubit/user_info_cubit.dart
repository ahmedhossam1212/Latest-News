import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/models/user_model.dart';
import 'package:latest_news/presntation/manager/states/user_info_states.dart';

class UserInfoCubit extends Cubit<UserInfoStates> {
  UserInfoCubit() : super(UserInfoInitState());

  static UserInfoCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserInfo({required String uId}) {
    emit(UserInfoLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJason(value.data()!);
      emit(UserInfoSuccesState());
      log("${value.data()}");
    }).catchError((error) {
      log(error.toString());
      emit(UserInfoErrState());
    });
  }
}
