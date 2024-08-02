import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/presntation/manager/states/lang_states.dart';

class LangCubit extends Cubit<LangStates> {
  LangCubit() : super(LangChangeInitState());
  static LangCubit get(context) => BlocProvider.of(context);

  void changeLang({bool? shared}) {
    if (shared != null) {
      lang = shared;
      emit(LangChangeSuccessState());
    } else {
      lang = !lang!;
      CacheHelper.putBoolean(key: 'lang', value: lang!).then((value) {
        emit(LangChangeSuccessState());
      });
    }
  }
}
