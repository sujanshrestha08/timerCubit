import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<int> {
  Timer? _timer;
  TimerCubit() : super(0);

  startTimer(int time) async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int time = state + 1;
      emit(time);
    });
  }

  pauseTimer() {
    _timer?.cancel();
  }

  resetTimer() {
    emit(0);
  }
}
