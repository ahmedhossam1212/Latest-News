import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/presntation/manager/states/localization_states.dart';

class LocalizationCubit extends Cubit<LocalizationStates> {
  LocalizationCubit() : super(LocalizationChangeInitState());

  static LocalizationCubit get(context) => BlocProvider.of(context);

  bool language = CacheHelper.getData(key: 'lang');

  void arLang() {
    CacheHelper.putBoolean(key: 'lang', value: true);
    emit(LocalizationChangeSuccessState());
  }

  void enLang() {
    CacheHelper.putBoolean(key: 'lang', value: false);
    emit(LocalizationChangeSuccessState());
  }
}
