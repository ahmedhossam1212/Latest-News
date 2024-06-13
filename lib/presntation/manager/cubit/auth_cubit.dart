import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latest_news/models/user_model.dart';
import 'package:latest_news/presntation/manager/states/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());
  static AuthCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  UserCredential? user;
  late final GoogleSignInAccount? googleUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
    userCreate(
        email: _auth.currentUser!.email!,
        image: _auth.currentUser!.photoURL!,
        uId: _auth.currentUser!.uid,
        name: _auth.currentUser!.displayName!);
    emit(AuthSuccessState(_auth.currentUser!.uid));
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
      userCreate(
          email: email,
          uId: value.user!.uid,
          name: name,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0LRALBrAWCugelYmEeNT8WqwO5yLUM_42b12eNED4Ku1E6GrnF6tmvYMI56NtDxKKWg8&usqp=CAU");
    }).catchError((err) {
      emit(AuthErrState());
    });
  }

  void userCreate({
    required String email,
    required String uId,
    required String name,
    required String image,
  }) {
    UserModel model =
        UserModel(email: email, uId: uId, name: name, image: image);

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

  void logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
  }

  googleSignOut() async {
    googleSignIn.disconnect();
  }
}
