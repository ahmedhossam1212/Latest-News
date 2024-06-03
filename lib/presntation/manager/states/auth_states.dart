class AuthStates {}

class AuthInitState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  final String uId;
  AuthSuccessState(this.uId);
}

class AuthErrState extends AuthStates {}
