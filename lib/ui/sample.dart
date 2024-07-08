import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/sample/sample_bloc.dart';

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SampleBloc, SampleState>(
          builder: (context, state) {
            state as SampleInitial;
            if (state.file == null) {
              return IconButton(
                onPressed: () {
                  context.read<SampleBloc>().add(CameraCapture());
                },
                icon: const Icon(
                  Icons.camera,
                  size: 40,
                ),
              );
            } else {
              return Image.file(
                File(state.file!.path.toString()),
                fit: BoxFit.fill,
              );
            }
          },
        ),
      ),
    );
  }
}
