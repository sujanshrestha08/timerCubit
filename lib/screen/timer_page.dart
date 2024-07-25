import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/timer_cubit.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text(
            'Timer',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocBuilder<TimerCubit, int>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.toString(),
                  style: const TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<TimerCubit>().startTimer(state);
                        debugPrint('Play');
                      },
                      icon: const Icon(Icons.play_arrow_rounded),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        context.read<TimerCubit>().pauseTimer();
                        debugPrint('Pause');
                      },
                      icon: const Icon(Icons.pause),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        context.read<TimerCubit>().resetTimer();
                        debugPrint('Reset');
                      },
                      icon: const Icon(Icons.restart_alt_outlined),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
