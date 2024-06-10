import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/models/user_model.dart';
import 'package:latest_news/presntation/manager/states/user_info_states.dart';

class UserInfoCubit extends Cubit<UserInfoStates> {
  UserInfoCubit() : super(UserInfoInitState());

  static UserInfoCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  String name = CacheHelper.getData(key: 'userName');
  String email = CacheHelper.getData(key: 'email');

  void getUserInfo() {
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
