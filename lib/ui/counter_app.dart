import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/counter_bloc/counter_bloc.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          final counterValue = (state as CounterValue).count;
          final isChecked = state.isChecked;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    context.read<CounterBloc>().add(ToggleCheckbox(value!));
                  }),
              Text(
                counterValue.toString(),
                style: const TextStyle(fontSize: 60),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Increment());
                    },
                    child: const Text(
                      'Increment',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Decrement());
                    },
                    child: const Text('Decrement'),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
