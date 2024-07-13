import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/counter_bloc/counter_bloc.dart';
import 'package:sample/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:sample/bloc/list_example/list_example_bloc.dart';
import 'package:sample/bloc/posts/posts_bloc.dart';
import 'package:sample/bloc/registration/registration_bloc.dart';
import 'package:sample/bloc/sample/sample_bloc.dart';
import 'package:sample/ui/favourite_app_sreen.dart';
import 'package:sample/ui/post_screen.dart';
import 'package:sample/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<RegistrationBloc>(create: (context) => RegistrationBloc()),
        BlocProvider<SampleBloc>(
            create: (context) => SampleBloc(ImagePickerUtis())),
        BlocProvider<ListExampleBloc>(create: (context) => ListExampleBloc()),
        BlocProvider<FavouriteAppBloc>(create: (context) => FavouriteAppBloc()),
        BlocProvider<PostsBloc>(create: (context) => PostsBloc()),
      ],
      child: const MaterialApp(
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: PostsScreen(),
      ),
    );
  }
}
