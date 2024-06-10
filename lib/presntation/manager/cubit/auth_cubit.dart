import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/models/user_model.dart';
import 'package:latest_news/presntation/manager/states/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());
  static AuthCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  late final GoogleSignInAccount? googleUser;
  Future signInWithGoogle(BuildContext context) async {
    googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    // ignore: use_build_context_synchronously
    AppRouter.goAndFinish(context, AppRouter.homeRout);
    CacheHelper.saveData(key: 'Gtoken', value: googleAuth.accessToken);
    CacheHelper.saveData(key: 'userName', value: googleUser!.displayName);
    CacheHelper.saveData(key: 'email', value: googleUser!.email);
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  void googleSignOut() {
    GoogleSignIn().disconnect();
  }

  void userLogin({required String email, required String password}) async {
    emit(AuthLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(AuthSuccessState(value.user!.uid));
    }).catchError((err) {
      emit(AuthErrState());
    });
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(AuthLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(email: email, uId: value.user!.uid, name: name);
    }).catchError((err) {
      emit(AuthErrState());
    });
  }

  void userCreate({
    required String email,
    required String uId,
    required String name,
  }) {
    UserModel model = UserModel(email: email, uId: uId, name: name);

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(AuthSuccessState(model.uId!));
    }).catchError((error) {
      emit(AuthErrState());
    });
  }
}
