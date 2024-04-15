import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressBarCubit extends Cubit<int> {
  ProgressBarCubit() : super(0);

  void selectedPage(int page) => emit(page);
  void skip() => emit(state + 1);
}
