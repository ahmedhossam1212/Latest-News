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
  UserCredential? user;
  late final GoogleSignInAccount? googleUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithGoogle(BuildContext context) async {
    emit(AuthLoadingState());
    try {
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

      await _auth.signInWithCredential(credential);
      CacheHelper.saveData(key: 'uId', value: _auth.currentUser!.uid);
      userCreate(
          email: _auth.currentUser!.email!,
          uId: _auth.currentUser!.uid,
          name: _auth.currentUser!.displayName!);
      // ignore: use_build_context_synchronously
      AppRouter.goAndFinish(context, AppRouter.homeRout);

      log(" google data :: ${_auth.currentUser!.uid}");
      emit(AuthSuccessState(_auth.currentUser!.uid));
    } catch (e) {
      emit(AuthErrState());
    }
  }

  void logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
  }

  void googleSignOut(BuildContext context) {
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
