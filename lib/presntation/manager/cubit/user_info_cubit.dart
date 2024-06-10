import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/models/user_model.dart';
import 'package:latest_news/presntation/manager/states/user_info_states.dart';

class UserInfoCubit extends Cubit<UserInfoStates> {
  UserInfoCubit() : super(UserInfoInitState());

  static UserInfoCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  User? user;
  GoogleAuthCredential? googleAuthCredential;
  GoogleSignInAccount? googleSignInAccount;

  void getUserInfo() {
    emit(UserInfoLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      log("${value.data()}");
      userModel = UserModel.fromJason(value.data()!);
      emit(UserInfoSuccesState());
    }).catchError((error) {
      log(error.toString());
      emit(UserInfoErrState());
    });
  }
}
