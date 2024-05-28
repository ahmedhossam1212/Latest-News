import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/models/user_model.dart';
import 'package:latest_news/presntation/manager/states/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());
  static AuthCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void userLogin({required String email, required String password}) async {
    emit(AuthLoadingState());

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(AuthSuccessState());
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
      emit(AuthSuccessState());
    }).catchError((error) {
      emit(AuthErrState());
    });
  }
}
