import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/presntation/manager/states/user_info_states.dart';

class UserInfoCubit extends Cubit<UserInfoStates> {
  UserInfoCubit() : super(UserInfoInitState());

  UserInfoCubit get(context) => BlocProvider.of(context);
}
