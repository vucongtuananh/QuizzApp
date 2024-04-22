import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/home/mock/mock_data.dart';

class ProgressBarCubit extends Cubit<int> {
  ProgressBarCubit() : super(0);

  void selectedPage(int page) => emit(page);
  void skip() {
    if (state == sample_data.length - 1) {
      emit(state);
    } else {
      emit(state + 1);
    }
  }
}
